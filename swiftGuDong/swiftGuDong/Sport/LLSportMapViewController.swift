//
//  LLSportMapViewController.swift
//  swiftGuDong
//
//  Created by LibraLiu on 16/10/26.
//  Copyright © 2016年 LL. All rights reserved.
//

import UIKit

private let annotationId = "annotationId"

class LLSportMapViewController: UIViewController {
    /// 是否设置了起始大头针
    fileprivate var hasSetStartLocation = false
    
    var sportTracking: LLSportTracking = LLSportTracking()
    

    /// 地图视图
     lazy var mapView: MAMapView = {
        let mapView = MAMapView(frame: self.view.bounds)

        mapView.showsScale = false
        mapView.showsUserLocation = true
        mapView.isRotateCameraEnabled = false
        mapView.userTrackingMode = MAUserTrackingMode.follow
        mapView.allowsBackgroundLocationUpdates = true
        mapView.pausesLocationUpdatesAutomatically = false
        mapView.delegate = self

        return mapView
    }()

    override func awakeFromNib() {
       setupMapView()
    }
    
    private func setupMapView() {

        self.view.insertSubview(mapView, at: 0)
        
    }
    
    
    @IBAction func closeMapView(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LLSportMapViewController : UIPopoverPresentationControllerDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if !(segue.destination.isKind(of: LLSportMapModeViewController.self)) {
            return
        }
        
        let vc = segue.destination as? LLSportMapModeViewController
        vc?.popoverPresentationController?.delegate = self
        vc?.preferredContentSize = CGSize(width: 0, height: 120)
        
        vc?.didSelectedMapMode = { [weak self] (type: MAMapType) in
            self?.mapView.mapType = type
        }
        vc?.currentType = mapView.mapType
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension LLSportMapViewController : MAMapViewDelegate{
    
    func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
        
        if !updatingLocation {
            return
        }
        
        if sportTracking.state != .Continue {
            return
        }
        
        if !hasSetStartLocation {
            hasSetStartLocation = true
            let annotation = MAPointAnnotation()
            annotation.coordinate = userLocation.coordinate
            mapView.addAnnotation(annotation)
        }
//        print(userLocation.location)
    }
    
    // 更改定位大头针视图
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        
        if !annotation.isKind(of: MAPointAnnotation.self) {
            return nil
        }
        
       var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationId)
        
        if annotationView == nil {
            annotationView = MAAnnotationView(annotation: annotation, reuseIdentifier: annotationId)
        }
        
        let image = sportTracking.sportImage
        annotationView?.image = image
        let height = -((image?.size.height)!) * 0.5
        annotationView?.centerOffset = CGPoint(x: 0, y: height)
        return annotationView
    }
}

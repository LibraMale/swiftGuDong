//
//  LLSportingViewController.swift
//  swiftGuDong
//
//  Created by LibraLiu on 16/10/26.
//  Copyright © 2016年 LL. All rights reserved.
//

import UIKit

class LLSportingViewController: UIViewController {

    var type : LLSportType?
    
    private var mapVc = LLSportMapViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapViewController()
    }

    @IBAction func showMapViewController(_ sender: UIButton) {
        
        present(mapVc, animated: true, completion: nil)
    }
    private func setupMapViewController() {
        let sb = UIStoryboard.init(name: "LLSportSporting", bundle: nil)
        mapVc = sb.instantiateViewController(withIdentifier: "sportMapViewController") as! LLSportMapViewController
        mapVc.sportTracking = LLSportTracking(type: type!, state: .Continue)
    }
}

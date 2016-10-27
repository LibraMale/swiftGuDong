//
//  LLMainViewController.swift
//  swiftGuDong
//
//  Created by LibraLiu on 16/10/26.
//  Copyright © 2016年 LL. All rights reserved.
//

import UIKit

class LLMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func startSport(_ sender: UIButton) {
        
        let type = sender.tag
        
        let sb = UIStoryboard.init(name: "LLSportSporting", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! LLSportingViewController
        vc.type = LLSportType(rawValue: type)
        
        self.present(vc, animated: true, completion: nil);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

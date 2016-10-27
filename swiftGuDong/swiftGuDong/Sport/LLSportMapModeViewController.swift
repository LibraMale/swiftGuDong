//
//  LLSportMapModeViewController.swift
//  swiftGuDong
//
//  Created by LibraLiu on 16/10/26.
//  Copyright © 2016年 LL. All rights reserved.
//

import UIKit

class LLSportMapModeViewController: UIViewController {
    
    var didSelectedMapMode : ((MAMapType)->())?
    
    var currentType : MAMapType?
    
    @IBOutlet private var mapButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        for button in mapButtons {
            let type = MAMapType(rawValue: button.tag)
            button.isSelected = (type == currentType)

        }
    }

    @IBAction private func selectMapButton(_ sender: UIButton) {
        let type = MAMapType(rawValue: sender.tag)
        if type == currentType {
            return
        }
        currentType = type!
        didSelectedMapMode?(currentType!)
        
        for button in mapButtons {
            button.isSelected = (button == sender)
        }
        
    }

}

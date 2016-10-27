//
//  LLSportTracking.swift
//  swiftGuDong
//
//  Created by LibraLiu on 16/10/26.
//  Copyright © 2016年 LL. All rights reserved.
//

import UIKit

/// 运动类型枚举
enum LLSportType : Int {
    case Run = 0
    case Walk = 1
    case Bike = 2
}
/// 运动状态枚举
enum LLSportState : Int {
    case Pause = 0
    case Continue = 1
    case Finish
}

class LLSportTracking: NSObject {

    var type : LLSportType?
    
    var state : LLSportState?
    
    var sportImage : UIImage?
    
    convenience init(type: LLSportType ,state:LLSportState) {
        self.init()
        switch type {
        case .Bike:
            sportImage = UIImage(named: "map_annotation_bike")
            break
        case .Run:
            sportImage = UIImage(named: "map_annotation_run")
            break
        case .Walk:
            sportImage = UIImage(named: "map_annotation_walk")
            break
        }
        
    }
    
//    func appendLocation(location: CLLocation) -> LLSportPolyLine {
//        
//        return 
//    }
}

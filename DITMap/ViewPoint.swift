//
//  ViewPoint.swift
//  DITMap
//
//  Created by D7702_10 on 2017. 9. 12..
//  Copyright © 2017년 김종현. All rights reserved.
//

import MapKit
import UIKit

class ViewPoint: NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) { //생성자 함수 (제일 먼저 실행)
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

//
//  ViewController.swift
//  DITMap
//
//  Created by 김종현 on 2017. 8. 31..
//  Copyright © 2017년 김종현. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var myMapView: MKMapView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //  지도의 center 위치, DIT 위치정보 35.166197, 129.072594
        let center : CLLocationCoordinate2D = CLLocationCoordinate2DMake(35.166197, 129.072594)
        let span : MKCoordinateSpan = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        
        myMapView.setRegion(region, animated: true)
        
        // Annotation(Pin) 꼽기
        let anno01 = MKPointAnnotation()
        anno01.coordinate = center
        anno01.title = "DIT 동의과학대학교"
        anno01.subtitle = "나의 꿈이 자라는 곳"
        
        // 부산시민공원 35.168444, 129.057832
        let anno02 = MKPointAnnotation()
        anno02.coordinate.latitude = 35.168444
        anno02.coordinate.longitude = 129.057832
        anno02.title = "부산시민공원"
        anno02.subtitle = "부산시민들의 휴식처"
        
        myMapView.addAnnotation(anno01)
        myMapView.addAnnotation(anno02)
        
        myMapView.delegate = self
    }
    
    // MKMapViewDelegate method
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "MyPin"
        var  annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true //악세서리 출력
            
            if annotation.title! == "부산시민공원" {
                annotationView?.pinTintColor = UIColor.green
            } else if annotation.title! == "DIT 동의과학대학교"{
                annotationView?.pinTintColor = UIColor.blue
            }
            
        } else {
            annotationView?.annotation = annotation
        }
        
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53)) //왼쪽 그림 크기지정
        
        if annotation.title! == "부산시민공원"{
        leftIconView.image = UIImage(named:"logo.jpg" )
        } else if annotation.title! == "DIT 동의과학대학교"{
            leftIconView.image = UIImage(named:"dit.png" )

        }
        
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        let btn = UIButton(type: .detailDisclosure)
        annotationView?.rightCalloutAccessoryView = btn
        
        return annotationView
        
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        print("callout Accessory Tapped!")
        
        
        let viewAnno = view.annotation
        let viewTitle: String = ((viewAnno?.title)!)!
        let viewSubTitle: String = ((viewAnno?.subtitle)!)!

        print("\(viewTitle) \(viewSubTitle)")

        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .actionSheet) //팝업 메세지 출력
        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil)) // 확인 추가
        ac.addAction(UIAlertAction(title: "DELETE", style: .destructive, handler: nil)) // 확인 추가
        present(ac, animated: true, completion: nil)
    }

}


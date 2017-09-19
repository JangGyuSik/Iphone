//
//  DetailViewController.swift
//  DITMap
//
//  Created by D7702_10 on 2017. 9. 14..
//  Copyright © 2017년 김종현. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var myImage: UIImageView!
    var Date = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(Date)
        
        if Date == "동의과학대학교"{
            myImage.image = UIImage(named:"dit2.jpg")
        } else if Date == "부산시민공원"{
            myImage.image = UIImage(named:"busan.jpg")
        }
        
        // Do any additional setup after loading the view.
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

//
//  ViewController.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 10/24/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import UIKit

class LogoPage: UIViewController {
    //TIMER
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func toCanvas () {
        
        performSegue(withIdentifier: "toCanvas", sender: self)
        
    }
    
    
    
    //VIEW DID APPEAR
    override func viewDidAppear(_ animated: Bool) {
        self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(LogoPage.toCanvas), userInfo: nil, repeats: false)
    }


}


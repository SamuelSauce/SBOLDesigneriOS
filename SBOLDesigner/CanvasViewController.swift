//
//  CanvasViewController.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 10/25/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    @IBOutlet weak var PartScrollView: PartScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.PartScrollView.setupScrollView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

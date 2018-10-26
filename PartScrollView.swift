//
//  CanvasViewController.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 10/25/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import UIKit

class PartScrollView: UIScrollView {
    @IBOutlet weak var CDS: UIButton!
    
    func setupScrollView(){
        self.layer.borderWidth = 2;
        self.layer.borderColor = UIColor.black.cgColor
        self.CDS.layer.borderWidth = 2;
        self.CDS.layer.borderColor = UIColor.black.cgColor
    }
}

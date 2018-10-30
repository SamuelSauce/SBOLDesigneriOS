//
//  CanvasViewController.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 10/25/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import UIKit

class PartScrollView: UIScrollView {
    func setupScrollView(){
        self.layer.borderWidth = 2;
        self.layer.borderColor = UIColor.black.cgColor
        self.CDS.layer.borderWidth = 2;
        self.CDS.layer.borderColor = UIColor.black.cgColor
        self.Gen.layer.borderWidth = 2;
        self.Gen.layer.borderColor = UIColor.black.cgColor
        self.RBS.layer.borderWidth = 2;
        self.RBS.layer.borderColor = UIColor.black.cgColor
        self.Pro.layer.borderWidth = 2;
        self.Pro.layer.borderColor = UIColor.black.cgColor
        self.Ter.layer.borderWidth = 2;
        self.Ter.layer.borderColor = UIColor.black.cgColor
        self.gRNA.layer.borderWidth = 2;
        self.gRNA.layer.borderColor = UIColor.black.cgColor
        self.Ori.layer.borderWidth = 2;
        self.Ori.layer.borderColor = UIColor.black.cgColor
        self.OriT.layer.borderWidth = 2;
        self.OriT.layer.borderColor = UIColor.black.cgColor
        self.PBS.layer.borderWidth = 2;
        self.PBS.layer.borderColor = UIColor.black.cgColor
        self.SR3.layer.borderWidth = 2;
        self.SR3.layer.borderColor = UIColor.black.cgColor
        self.SR5.layer.borderWidth = 2;
        self.SR5.layer.borderColor = UIColor.black.cgColor
        self.Scar.layer.borderWidth = 2;
        self.Scar.layer.borderColor = UIColor.black.cgColor
        self.Op.layer.borderWidth = 2;
        self.Op.layer.borderColor = UIColor.black.cgColor
        self.BRS.layer.borderWidth = 2;
        self.BRS.layer.borderColor = UIColor.black.cgColor
        self.OH5.layer.borderWidth = 2;
        self.OH5.layer.borderColor = UIColor.black.cgColor
        self.OH3.layer.borderWidth = 2;
        self.OH3.layer.borderColor = UIColor.black.cgColor
        self.PolyA.layer.borderWidth = 2;
        self.PolyA.layer.borderColor = UIColor.black.cgColor
        self.SRS.layer.borderWidth = 2;
        self.SRS.layer.borderColor = UIColor.black.cgColor
        self.BRS.layer.borderWidth = 2;
        self.BRS.layer.borderColor = UIColor.black.cgColor
        self.NGA.layer.borderWidth = 2;
        self.NGA.layer.borderColor = UIColor.black.cgColor
        self.Sig.layer.borderWidth = 2;
        self.Sig.layer.borderColor = UIColor.black.cgColor
        self.BS.layer.borderWidth = 2;
        self.BS.layer.borderColor = UIColor.black.cgColor
    }
    //These are the 'variables' pertaining to each button.
    @IBOutlet weak var CDS: UIButton!
    @IBOutlet weak var Gen: UIButton!
    @IBOutlet weak var RBS: UIButton!
    @IBOutlet weak var Pro: UIButton!
    @IBOutlet weak var Ter: UIButton!
    @IBOutlet weak var gRNA: UIButton!
    @IBOutlet weak var Ori: UIButton!
    @IBOutlet weak var OriT: UIButton!
    @IBOutlet weak var PBS: UIButton!
    @IBOutlet weak var SR5: UIButton!
    @IBOutlet weak var SR3: UIButton!
    @IBOutlet weak var Scar: UIButton!
    @IBOutlet weak var Op: UIButton!
    @IBOutlet weak var BRS: UIButton!
    @IBOutlet weak var OH5: UIButton!
    @IBOutlet weak var OH3: UIButton!
    @IBOutlet weak var PolyA: UIButton!
    @IBOutlet weak var SRS: UIButton!
    @IBOutlet weak var NGA: UIButton!
    @IBOutlet weak var Sig: UIButton!
    @IBOutlet weak var BS: UIButton!
}

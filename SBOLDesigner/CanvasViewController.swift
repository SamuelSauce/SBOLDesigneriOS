//
//  CanvasViewController.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 10/25/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.PartScrollView.setupScrollView()
        currentlySelected = PartScrollView.CDS
        currentlySelected.backgroundColor = UIColor.blue
        self.DrawView.setCurrentGlyph(image: (self.PartScrollView.CDS.imageView?.image)!)
        self.DrawView.setupView()
    }
    
    @IBOutlet weak var PartScrollView: PartScrollView!
    @IBOutlet var DrawView: DrawView!
    var currentlySelected: UIButton!
    
    @IBAction func CDS(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.CDS
        AddPart(part: (self.PartScrollView.CDS.imageView?.image)!)
    }
    @IBAction func Gen(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.Gen
        AddPart(part: (self.PartScrollView.Gen.imageView?.image)!)
    }
    @IBAction func RBS(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.RBS
        AddPart(part: (self.PartScrollView.RBS.imageView?.image)!)
    }
    @IBAction func Pro(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.Pro
        AddPart(part: (self.PartScrollView.Pro.imageView?.image)!)
    }
    @IBAction func Ter(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.Ter
        AddPart(part: (self.PartScrollView.Ter.imageView?.image)!)
    }
    @IBAction func gRNA(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.gRNA
        AddPart(part: (self.PartScrollView.gRNA.imageView?.image)!)
    }
    @IBAction func Ori(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.Ori
        AddPart(part: (self.PartScrollView.Ori.imageView?.image)!)
    }
    @IBAction func OriT(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.OriT
        AddPart(part: (self.PartScrollView.OriT.imageView?.image)!)
    }
    @IBAction func PBS(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.PBS
        AddPart(part: (self.PartScrollView.PBS.imageView?.image)!)
    }
    @IBAction func SR5(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.SR5
        AddPart(part: (self.PartScrollView.SR5.imageView?.image)!)
    }
    @IBAction func SR3(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.SR3
        AddPart(part: (self.PartScrollView.SR3.imageView?.image)!)
    }
    @IBAction func Scar(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.Scar
        AddPart(part: (self.PartScrollView.Scar.imageView?.image)!)
    }
    @IBAction func Op(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.Op
        AddPart(part: (self.PartScrollView.Op.imageView?.image)!)
    }
    @IBAction func BRS(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.BRS
        AddPart(part: (self.PartScrollView.BRS.imageView?.image)!)
    }
    @IBAction func OH5(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.OH5
        AddPart(part: (self.PartScrollView.OH5.imageView?.image)!)
    }
    @IBAction func OH3(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.OH3
        AddPart(part: (self.PartScrollView.OH3.imageView?.image)!)
    }
    @IBAction func PolyA(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.PolyA
        AddPart(part: (self.PartScrollView.PolyA.imageView?.image)!)
    }
    @IBAction func SRS(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.SRS
        AddPart(part: (self.PartScrollView.SRS.imageView?.image)!)
    }
    @IBAction func NGA(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.NGA
        AddPart(part: (self.PartScrollView.NGA.imageView?.image)!)
    }
    @IBAction func Sig(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.Sig
        AddPart(part: (self.PartScrollView.Sig.imageView?.image)!)
    }
    @IBAction func BS(_ sender: Any) {
        currentlySelected.backgroundColor = UIColor.white
        currentlySelected = PartScrollView.BS
        AddPart(part: (self.PartScrollView.BS.imageView?.image)!)
    }
    
    func AddPart(part: UIImage){
        currentlySelected.backgroundColor = UIColor.blue
        self.DrawView.setCurrentGlyph(image: part)
    }

}

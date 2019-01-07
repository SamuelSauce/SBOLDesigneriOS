//
//  GlyphImageView.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 11/30/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import UIKit

class GlyphImageView: UIImageView {
    var parentStrand: Strand?
    var index: Int?
    var selected: Bool!
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(strand: Strand?, image: UIImage?) {
        self.parentStrand = strand
        index = 0
        super.init(image: image)
        self.clipsToBounds = true
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.isUserInteractionEnabled = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //De-selecting previously selected part.
        if parentStrand?.superView.currentlySelectedPart != nil{
            createInteraction(part: (parentStrand?.superView.currentlySelectedPart)!, interaction: (parentStrand?.superView.interaction)!)
            parentStrand?.superView.currentlySelectedPart.isSelected(selected: false)
        }
        
        //Selecting new part
        parentStrand?.superView.currentlySelectedPart = self
        self.isSelected(selected: true)
    }
    
    func enabled(enabled: Bool){
        if enabled{
            self.layer.borderColor = UIColor.gray.cgColor
            self.isUserInteractionEnabled = true
        }else{
            self.layer.borderColor = UIColor.clear.cgColor
            self.layer.borderWidth = 2.0
            self.isUserInteractionEnabled = false
            selected = false
        }
    }
    
    func isSelected(selected: Bool){
        if selected{
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 4.0
            self.selected = selected
        }else{
            self.layer.borderColor = UIColor.gray.cgColor
            self.layer.borderWidth = 2.0
            self.selected = selected
        }
    }
    
    func createInteraction(part: GlyphImageView, interaction: Int) -> Void{
        switch interaction {
            case 0: //No interaction
                break
            case 1: //Repress
                 parentStrand?.superView.drawInteraction(interaction: interaction, from: part, to: self)
            case 2:
                print("C")
            case 3:
                print("D")
            default:
                print("F. You failed")
        }
    }
}

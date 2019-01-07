//
//  strand.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 11/21/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import Foundation
import UIKit

class Strand{
    
    private var nextSlot: CGPoint!
    private let height: CGFloat = 128
    private var width: CGFloat!
    private let strandBorder: CAShapeLayer
    private let backBone: CAShapeLayer
    var superView: DrawView!
    var parts: [GlyphImageView]!
    var frame: CGRect!
    var minX: CGFloat!
    var minY: CGFloat!
    var isOn: Bool!
    var spacing: CGFloat = 80
    
    init(superView: DrawView, x: CGFloat, y: CGFloat) {
        self.superView = superView
        isOn = true
        minX = x
        minY = y
        width = 80
        self.frame = CGRect(x: minX, y: minY, width: width, height: self.height)
        self.parts = [GlyphImageView]()
        //Setting up border
        let border = UIBezierPath.init(rect: frame)
        strandBorder = CAShapeLayer()
        strandBorder.path = border.cgPath
        strandBorder.strokeColor = UIColor.cyan.cgColor
        strandBorder.lineWidth = 2
        strandBorder.fillColor = UIColor.clear.cgColor
        
        //Setting up backbone
        let line = UIBezierPath()
        line.move(to: CGPoint(x: minX, y: minY + height/2))
        line.addLine(to: CGPoint(x: minX+width,y: minY + height/2))
        backBone = CAShapeLayer()
        backBone.path = line.cgPath
        backBone.strokeColor = UIColor.black.cgColor
        backBone.lineWidth = 4
        backBone.fillColor = UIColor.clear.cgColor
        //Adding views
        superView.layer.addSublayer(strandBorder)
        superView.layer.addSublayer(backBone)
        superView.layersToRemove += 2
        superView.setNeedsDisplay()
    }
    
    func addPart(part: GlyphImageView) -> Void {
        part.index = parts.count
        parts.append(part)
        superView.addSubview(part)
    }
    
    func deletePart(part: GlyphImageView) -> Void {
        parts.remove(at: part.index!)
        if parts.isEmpty {
            self.deleteStrand()
        }
    }
    
    func getNextSlot() -> CGPoint{
        if nextSlot == nil{
            nextSlot = CGPoint(x: self.frame.minX, y: self.frame.minY)
        }else{
            nextSlot.x = nextSlot.x+spacing
            self.width = self.width+spacing
        }
        updated()
        return self.nextSlot
    }
    
    func deleteSlot(){
        if nextSlot == nil{
            nextSlot = CGPoint(x: self.frame.minX, y: self.frame.minY)
        }else{
            nextSlot.x = nextSlot.x-spacing
            self.width = self.width-spacing
        }
        updated()
    }
    
    func deleteStrand(){
        for part in parts{
            part.removeFromSuperview()
        }
        strandBorder.path = nil
        backBone.path = nil
    }
    
    func enabled(isOn: Bool) -> Void{
        if isOn{
            strandBorder.strokeColor = UIColor.cyan.cgColor
        }else{
            strandBorder.strokeColor = UIColor.clear.cgColor
        }
    }
    
    func updated() -> Void {
        //Updating border
        self.frame = CGRect(x: minX, y: minY, width: width, height: self.height)
        let border = UIBezierPath.init(rect: frame)
        strandBorder.path = border.cgPath
        
        //Updating line
        let line = UIBezierPath()
        line.move(to: CGPoint(x: minX, y: minY + height/2))
        line.addLine(to: CGPoint(x: minX+width,y: minY + height/2))
        backBone.path = line.cgPath
    }
}

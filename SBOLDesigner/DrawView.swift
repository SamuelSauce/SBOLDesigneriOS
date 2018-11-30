//
//  DrawView.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 11/5/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import Foundation
import UIKit

class DrawView: UIView{
    var lineColor: UIColor!
    var lineWidth: CGFloat!
    var path:UIBezierPath!
    var touchPoint: CGPoint!
    var startingPoint: CGPoint!
    var currentGlyph: UIImage!
    var layersToRemove = 0
    var pencilSelected: Bool!
    var drawingStrand: Bool!
    var strandStarted: Bool!
    var handSelected: Bool!
    var undoStack: [Int]!
    var currentlySelectedStrand: strand!
    var strands: [strand]!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var eraserButton: UIButton!
    @IBAction func eraserClicked(_ sender: Any) {
        pencilButton.setImage(UIImage(named: "pencil"), for: .normal)
        strandButton.setImage(UIImage(named: "dna"), for: .normal)
        eraserButton.setImage(UIImage(named: "eraserColor"), for: .normal)
        handButton.setImage(UIImage(named: "hand"), for: .normal)
        lineColor = UIColor.white
        lineWidth = 20
        drawingStrand = false
        pencilSelected = false
        handSelected = false
        turnOffStrands()
    }
    @IBOutlet weak var handButton: UIButton!
    @IBAction func handClicked(_ sender: Any) {
        pencilButton.setImage(UIImage(named: "pencil"), for: .normal)
        strandButton.setImage(UIImage(named: "dna"), for: .normal)
        eraserButton.setImage(UIImage(named: "eraser"), for: .normal)
        handButton.setImage(UIImage(named: "handColor"), for: .normal)
        drawingStrand = false
        strandStarted = false
        pencilSelected = false
        handSelected = true
        turnOnStrands()
    }
    
    @IBOutlet weak var pencilButton: UIButton!
    @IBAction func pencilClicked(_ sender: Any) {
        pencilButton.setImage(UIImage(named: "pencilColor"), for: .normal)
        strandButton.setImage(UIImage(named: "dna"), for: .normal)
        eraserButton.setImage(UIImage(named: "eraser"), for: .normal)
        handButton.setImage(UIImage(named: "hand"), for: .normal)
        lineColor = UIColor.black
        lineWidth = 5
        drawingStrand = false
        strandStarted = false
        handSelected = false
        pencilSelected = true
        turnOffStrands()
    }
    
    @IBOutlet weak var undoButton: UIButton!
    
    @IBAction func undoButton(_ sender: Any) {
        let popped = pop()
        //Case if deleting a strand
        if popped == 0{
            if let imageView = self.subviews.last as? strand{
                imageView.removeFromSuperview()
                currentlySelectedStrand = nil
                self.setNeedsDisplay()
                return
            }
        //Case if deleting a drawn layer
        }else if popped == 1{
            var count = 1
            if(layersToRemove > 0){
                path.removeAllPoints()
                while count > 0{
                    self.layer.sublayers?.remove(at: (self.layer.sublayers?.count)! - 1)
                    count -= 1
                    layersToRemove -= 1
                }
            }
        }//Case if deleting a glyph from strand
        else if popped == 2{
            if let imageView = self.subviews.last as? GlyphImageView{
                imageView.parentStrand?.deleteSlot()
                imageView.removeFromSuperview()
                self.setNeedsDisplay()
                return
            }
        }
        else{
            //do nothing??
        }
    }
    @IBOutlet weak var strandButton: UIButton!
    @IBAction func strandClicked(_ sender: Any) {
        pencilButton.setImage(UIImage(named: "pencil"), for: .normal)
        strandButton.setImage(UIImage(named: "dnaColor"), for: .normal)
        eraserButton.setImage(UIImage(named: "eraser"), for: .normal)
        handButton.setImage(UIImage(named: "hand"), for: .normal)
        lineColor = UIColor.black
        lineWidth = 5
        drawingStrand = true
        handSelected = false
        pencilSelected = false
        turnOffStrands()
    }
    
    @IBAction func clearClicked(_ sender: Any) {
        clearCanvas()
    }
    
    func turnOffStrands(){
        if strands != nil{
            for strand in strands!{
                strand.isUserInteractionEnabled = false
            }
        }
    }
    
    func turnOnStrands(){
        if strands != nil{
            for strand in strands!{
                strand.isUserInteractionEnabled = true
            }
        }
    }
    func setupView(){
        clearButton.layer.cornerRadius = clearButton.frame.size.width/8
        clearButton.clipsToBounds = true
        self.clearButton.backgroundColor = UIColor.red
        lineColor = UIColor.black
        lineWidth = 5
        pencilButton.setImage(UIImage(named: "pencilColor"), for: .normal)
        undoStack = [-1]
        strands = [strand]()
        drawingStrand = false
        handSelected = false
        pencilSelected = true
    }
    
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self)
        if handSelected == true{
            currentlySelectedStrand.layer.borderWidth = 0
            self.currentlySelectedStrand = nil
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //This piece of code erases the last 'ghost' drawing of what the DNA strand will look like.
        if drawingStrand == true{
            if strandStarted == true{
                if(layersToRemove > 0){
                    path.removeAllPoints()
                    self.layer.sublayers?.remove(at: (self.layer.sublayers?.count)! - 1)
                    layersToRemove -= 1
                }
            }
            strandStarted = true
        }
        if handSelected == false{
            let touch = touches.first
            touchPoint = touch?.location(in: self)
            
            path = UIBezierPath()
            path.move(to: startingPoint)
            path.addLine(to: touchPoint)
            /*The only instance where we want the starting point to reset is if we
             aren't drawing a dna strand. Otherwise the canvas will not show a live update of
             DNA strand path.*/
            if drawingStrand == false {
                undoStack.append(1)
                startingPoint = touchPoint
            }
        }
        drawShapeLayer()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if drawingStrand == true && strandStarted == true{
            var count = 1
            if(layersToRemove > 0){
                path.removeAllPoints()
                while count > 0{
                    self.layer.sublayers?.remove(at: (self.layer.sublayers?.count)! - 1)
                    count -= 1
                    layersToRemove -= 1
                }
            }
            if currentlySelectedStrand != nil{
                currentlySelectedStrand.layer.borderWidth = 0
            }
            let imageView = strand(image: UIImage(named: "line"))
            imageView.layer.borderWidth = 2
            imageView.layer.borderColor = UIColor.cyan.cgColor
            imageView.setSuperView(superView: self)
            imageView.frame = CGRect(x: startingPoint.x, y: startingPoint.y - 128/2, width: abs(touchPoint.x-startingPoint.x), height: 128)
            self.addSubview(imageView)
            self.currentlySelectedStrand = imageView
            self.strands.append(imageView)
            drawShapeLayer()
            strandStarted = false
            undoStack.append(0)
        }
    }
    func drawShapeLayer(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        layersToRemove += 1
        self.setNeedsDisplay()
    }
    
    func clearCanvas(){
        for view in self.subviews{
            if let imageView = view as? UIImageView{
                imageView.removeFromSuperview()
            }
        }
        if(layersToRemove > 0){
            path.removeAllPoints()
            while layersToRemove > 0{
                self.layer.sublayers?.remove(at: (self.layer.sublayers?.count)! - 1)
                layersToRemove -= 1
            }
        }
        undoStack.removeAll()
        undoStack.append(-1)
        self.setNeedsDisplay()
    }
    
    func setCurrentGlyph(image: UIImage){
        self.currentGlyph = image
        if self.currentlySelectedStrand != nil{
            let nextSlot = self.currentlySelectedStrand.getNextSlot()
            if nextSlot.x != -1{
                let imageView = GlyphImageView(strand: currentlySelectedStrand, image: self.currentGlyph)
                imageView.frame = CGRect(x: nextSlot.x, y: nextSlot.y, width: 73, height: 128)
                undoStack.append(2)
                self.addSubview(imageView)
            }
        }
    }
    
    func pop() -> Int{
        if undoStack.count > 1{
            return undoStack.removeLast()
        }else{
            return -1
        }
    }
    
    func changeCurrent(strand: strand){
        if handSelected{
            currentlySelectedStrand.layer.borderWidth = 0
            currentlySelectedStrand = strand
            currentlySelectedStrand.layer.borderWidth = 2
            currentlySelectedStrand.layer.borderColor = UIColor.cyan.cgColor
        }
    }
}

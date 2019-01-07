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
    var path: UIBezierPath!
    var touchPoint: CGPoint!
    var startingPoint: CGPoint!
    var currentGlyph: UIImage!
    var layersToRemove = 0
    var pencilSelected: Bool!
    var drawingStrand: Bool!
    var erasing: Bool!
    var handSelected: Bool!
    var textSelected: Bool!
    var undoStack: [Int]!
    var currentlySelectedStrand: Strand!
    var strands: [Strand]!
    @IBOutlet weak var deleteStrandButton: UIButton!
    @IBAction func deleteStrand(_ sender: Any) {
        currentlySelectedStrand.deleteStrand()
    }
    
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var yellow: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var purple: UIButton!
    @IBAction func redClicked(_ sender: Any) {
        lineColor = UIColor.red
        unHighlight()
        red.layer.borderWidth = 4
    }
    @IBAction func yellowClicked(_ sender: Any) {
        lineColor = UIColor.yellow
        unHighlight()
        yellow.layer.borderWidth = 4
    }
    @IBAction func blueClicked(_ sender: Any) {
        lineColor = UIColor.blue
        unHighlight()
        blue.layer.borderWidth = 4
    }
    @IBAction func greenClicked(_ sender: Any) {
        lineColor = UIColor.green
        unHighlight()
        green.layer.borderWidth = 4
    }
    @IBAction func purpleClicked(_ sender: Any) {
        lineColor = UIColor.purple
        unHighlight()
        purple.layer.borderWidth = 4
    }
    
    private func unHighlight(){
        red.layer.borderWidth = 0
        blue.layer.borderWidth = 0
        yellow.layer.borderWidth = 0
        green.layer.borderWidth = 0
        purple.layer.borderWidth = 0
        red.layer.borderColor = UIColor.black.cgColor
    }
    
    private func turnOffColors(){
        red.isHidden = true
        yellow.isHidden = true
        blue.isHidden = true
        green.isHidden = true
        purple.isHidden = true
        red.isEnabled = false
        yellow.isEnabled = false
        blue.isEnabled = false
        green.isEnabled = false
        purple.isEnabled = false
    }
    
    private func turnOnColors(){
        red.isHidden = false
        yellow.isHidden = false
        blue.isHidden = false
        green.isHidden = false
        purple.isHidden = false
        red.isEnabled = true
        yellow.isEnabled = true
        blue.isEnabled = true
        green.isEnabled = true
        purple.isEnabled = true
    }

    private func setupColorButtons(){
        roundButton(roundness: 2, button: self.red)
        roundButton(roundness: 2, button: self.yellow)
        roundButton(roundness: 2, button: self.blue)
        roundButton(roundness: 2, button: self.green)
        roundButton(roundness: 2, button: self.purple)
        red.backgroundColor = UIColor.red
        yellow.backgroundColor = UIColor.yellow
        blue.backgroundColor = UIColor.blue
        green.backgroundColor = UIColor.green
        purple.backgroundColor = UIColor.purple
        red.layer.borderColor = UIColor.black.cgColor
        yellow.layer.borderColor = UIColor.black.cgColor
        blue.layer.borderColor = UIColor.black.cgColor
        green.layer.borderColor = UIColor.black.cgColor
        purple.layer.borderColor = UIColor.black.cgColor
        unHighlight()
        turnOnColors()
    }
    
    private func roundButton(roundness: Int, button: UIButton){
        button.layer.cornerRadius = button.frame.size.width/CGFloat(roundness)
        button.clipsToBounds = true
    }
    @IBOutlet weak var textButton: UIButton!
    @IBAction func textClicked(_ sender: Any) {
        pencilButton.setImage(UIImage(named: "pencil"), for: .normal)
        strandButton.setImage(UIImage(named: "dna"), for: .normal)
        eraserButton.setImage(UIImage(named: "eraser"), for: .normal)
        handButton.setImage(UIImage(named: "hand"), for: .normal)
        textButton.setImage(UIImage(named: "textColor"), for: .normal)
        lineColor = UIColor.black
        lineWidth = 5
        drawingStrand = false
        pencilSelected = false
        handSelected = false
        textSelected = true
        erasing = false
        turnOffColors()
        deleteStrandButton.isEnabled = false
        deleteStrandButton.isHidden = true
        glyphsEnabled(enabled: false)
    }
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var eraserButton: UIButton!
    @IBAction func eraserClicked(_ sender: Any) {
        pencilButton.setImage(UIImage(named: "pencil"), for: .normal)
        strandButton.setImage(UIImage(named: "dna"), for: .normal)
        eraserButton.setImage(UIImage(named: "eraserColor"), for: .normal)
        handButton.setImage(UIImage(named: "hand"), for: .normal)
        textButton.setImage(UIImage(named: "text"), for: .normal)
        textSelected = false
        lineColor = UIColor.white
        lineWidth = 20
        drawingStrand = false
        pencilSelected = false
        handSelected = false
        erasing = true
        turnOffColors()
        deleteStrandButton.isEnabled = false
        deleteStrandButton.isHidden = true
        glyphsEnabled(enabled: false)
    }
    @IBOutlet weak var handButton: UIButton!
    @IBAction func handClicked(_ sender: Any) {
        pencilButton.setImage(UIImage(named: "pencil"), for: .normal)
        strandButton.setImage(UIImage(named: "dna"), for: .normal)
        eraserButton.setImage(UIImage(named: "eraser"), for: .normal)
        handButton.setImage(UIImage(named: "handColor"), for: .normal)
        textButton.setImage(UIImage(named: "text"), for: .normal)
        textSelected = false
        drawingStrand = false
        pencilSelected = false
        erasing = false
        turnOffColors()
        handSelected = true
        deleteStrandButton.isEnabled = false
        deleteStrandButton.isHidden = true
        glyphsEnabled(enabled: true)
        currentlySelectedStrand.enabled(isOn: false)
        currentlySelectedStrand = nil
    }
    
    @IBOutlet weak var pencilButton: UIButton!
    @IBAction func pencilClicked(_ sender: Any) {
        pencilButton.setImage(UIImage(named: "pencilColor"), for: .normal)
        strandButton.setImage(UIImage(named: "dna"), for: .normal)
        eraserButton.setImage(UIImage(named: "eraser"), for: .normal)
        handButton.setImage(UIImage(named: "hand"), for: .normal)
        textButton.setImage(UIImage(named: "text"), for: .normal)
        textSelected = false
        lineColor = UIColor.black
        lineWidth = 5
        drawingStrand = false
        handSelected = false
        pencilSelected = true
        erasing = false
        turnOnColors()
        unHighlight()
        deleteStrandButton.isEnabled = false
        deleteStrandButton.isHidden = true
        glyphsEnabled(enabled: false)
    }
    
    @IBOutlet weak var undoButton: UIButton!
    
    @IBAction func undoButton(_ sender: Any) {
        let popped = pop()
        //Case if deleting a strand
        if popped == 0{
            strands.popLast()?.deleteStrand()
            currentlySelectedStrand = nil
            return
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
                imageView.parentStrand?.deletePart(part: imageView)
                imageView.removeFromSuperview()
                self.setNeedsDisplay()
                return
            }
        }//Case if deleting a text box.
        else if popped == 3{
            if let textBox = self.subviews.last as? UITextField{
                textBox.removeFromSuperview()
                self.setNeedsDisplay()
                return
            }
        }
    }
    @IBOutlet weak var strandButton: UIButton!
    @IBAction func strandClicked(_ sender: Any) {
        pencilButton.setImage(UIImage(named: "pencil"), for: .normal)
        strandButton.setImage(UIImage(named: "dnaColor"), for: .normal)
        eraserButton.setImage(UIImage(named: "eraser"), for: .normal)
        handButton.setImage(UIImage(named: "hand"), for: .normal)
        textButton.setImage(UIImage(named: "text"), for: .normal)
        textSelected = false
        lineColor = UIColor.black
        lineWidth = 5
        drawingStrand = true
        handSelected = false
        pencilSelected = false
        erasing = false
        turnOffColors()
        deleteStrandButton.isEnabled = true
        deleteStrandButton.isHidden = false
        bringSubviewToFront(deleteStrandButton)
        glyphsEnabled(enabled: false)
    }
    
    @IBAction func clearClicked(_ sender: Any) {
        clearCanvas()
    }
    
    func setupView(){
        roundButton(roundness: 8, button: clearButton)
        self.deleteStrandButton.isEnabled = false
        self.deleteStrandButton.isHidden = true
        self.clearButton.backgroundColor = UIColor.red
        lineColor = UIColor.black
        lineWidth = 5
        pencilButton.setImage(UIImage(named: "pencilColor"), for: .normal)
        undoStack = [-1]
        strands = [Strand]()
        drawingStrand = false
        handSelected = false
        pencilSelected = true
        erasing = false
        setupColorButtons()
        glyphsEnabled(enabled: false)
    }
    
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self)
        if currentlySelectedStrand != nil{
            currentlySelectedStrand.enabled(isOn: false)
            currentlySelectedStrand = nil
        }
        if textSelected == true{
            let textField = UITextField()
            textField.frame = CGRect(x: startingPoint.x, y: startingPoint.y - 10/2, width: 200, height: 30)
            self.addSubview(textField)
            undoStack.append(3)
            textField.select(self)
        }else if drawingStrand == true{
            var foundStrand = false
            for strand in strands{
                if strand.frame.contains(startingPoint){
                    currentlySelectedStrand = strand
                    foundStrand = true
                    strand.enabled(isOn: true)
                }else{
                    strand.enabled(isOn: false)
                }
            }
            if !foundStrand{
                let strand = Strand(superView: self, x: startingPoint.x, y: startingPoint.y - 128/2)
                self.currentlySelectedStrand = strand
                self.strands.append(strand)
                undoStack.append(0)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pencilSelected || erasing{
            let touch = touches.first
            touchPoint = touch?.location(in: self)
            path = UIBezierPath()
            path.move(to: startingPoint)
            path.addLine(to: touchPoint)
            undoStack.append(1)
            startingPoint = touchPoint
            drawShapeLayer()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for strand in strands{
            for part in strand.parts{
                bringSubviewToFront(part)
            }
            strand.updated()
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
            }else if let imageView = view as? UITextField{
                imageView.removeFromSuperview()
            }
        }
        if(layersToRemove > 0){
            while layersToRemove > 0{
                self.layer.sublayers?.remove(at: (self.layer.sublayers?.count)! - 1)
                layersToRemove -= 1
            }
        }
        for strand in self.strands{
            strand.deleteStrand()
        }
        strands = [Strand]()
        undoStack.removeAll()
        undoStack.append(-1)
        self.setNeedsDisplay()
    }
    func setCurrentGlyph(image: UIImage){
        self.currentGlyph = image
        if self.currentlySelectedStrand != nil{
            let nextSlot = self.currentlySelectedStrand.getNextSlot()
            if nextSlot.x != -1{
                let newPart = GlyphImageView(strand: currentlySelectedStrand, image: self.currentGlyph)
                newPart.frame = CGRect(x: nextSlot.x, y: nextSlot.y, width: 73, height: 128)
                newPart.parentStrand?.addPart(part: newPart)
                undoStack.append(2)
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
    
    func glyphsEnabled(enabled: Bool){
        for strand in strands{
            for part in strand.parts{
                part.enabled(enabled: enabled)
            }
        }
    }
}

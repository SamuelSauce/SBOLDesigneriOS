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
    @IBOutlet weak var drawOrGlyph: UISegmentedControl!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func clearClicked(_ sender: Any) {
        clearCanvas()
    }
    
    func setupView(){
        clearButton.layer.cornerRadius = clearButton.frame.size.width/8
        clearButton.clipsToBounds = true
        self.clearButton.backgroundColor = UIColor.red
        lineColor = UIColor.black
        lineWidth = 5
    }
    
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self)
        if drawOrGlyph.selectedSegmentIndex == 0{
            let imageView = UIImageView(image: currentGlyph)
            imageView.frame = CGRect(x: startingPoint.x - (73/2), y: startingPoint.y - (128/2), width: 73, height: 128)
            self.addSubview(imageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if drawOrGlyph.selectedSegmentIndex == 1{
            let touch = touches.first
            touchPoint = touch?.location(in: self)
            
            path = UIBezierPath()
            path.move(to: startingPoint)
            path.addLine(to: touchPoint)
            startingPoint = touchPoint
            
            drawShapeLayer()
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
        self.setNeedsDisplay()
    }
    
    func setCurrentGlyph(image: UIImage){
        self.currentGlyph = image
    }
}

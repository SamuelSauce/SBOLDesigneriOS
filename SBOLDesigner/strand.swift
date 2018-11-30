//
//  strand.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 11/21/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import Foundation
import UIKit

class strand: UIImageView{
    
    private var nextSlot: CGPoint!
    private var superView: DrawView!
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.isUserInteractionEnabled = true
        //self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superView.changeCurrent(strand: self)
    }
    
    func setSuperView(superView: DrawView){
        self.superView = superView
    }
    
    func getNextSlot() -> CGPoint{
        if nextSlot == nil{
            nextSlot = CGPoint(x: self.frame.minX, y: self.frame.minY)
        }else{
            if nextSlot.x+146 > self.frame.maxX{
                return CGPoint(x: -1, y: -1)
            }
            nextSlot.x = nextSlot.x+146
        }
        return self.nextSlot
    }
    
    func deleteSlot(){
        if nextSlot == nil{
            nextSlot = CGPoint(x: self.frame.minX, y: self.frame.minY)
        }else{
            nextSlot.x = nextSlot.x-146
        }
    }
}

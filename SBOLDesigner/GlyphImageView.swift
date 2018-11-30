//
//  GlyphImageView.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 11/30/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import UIKit

class GlyphImageView: UIImageView {
    var parentStrand: strand?
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(strand: strand?, image: UIImage?) {
        self.parentStrand = strand
        super.init(image: image)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.isUserInteractionEnabled = true
        //self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

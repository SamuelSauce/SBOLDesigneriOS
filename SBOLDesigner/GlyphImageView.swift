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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
    }

}

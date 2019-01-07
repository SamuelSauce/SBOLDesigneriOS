//
//  InteractionImageView.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 1/7/19.
//  Copyright © 2019 Samuel Bridge. All rights reserved.
//

import UIKit

class InteractionImageView: UIImageView {

    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }

}

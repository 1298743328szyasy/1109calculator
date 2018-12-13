//
//  DigitButton.swift
//  Calculator
//
//  Created by s20171103192 on 2018/11/7.
//  Copyright © 2018 s20171103192. All rights reserved.
//

import UIKit

class DigitButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height * 0.5
        layer.masksToBounds = true
    }

}

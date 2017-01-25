//
//  LinkLabel.swift
//  Movie For Thought
//
//  Created by Ak Kieu on 1/23/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import Foundation
import UIKit

class LinkLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if self.text != nil && self.text != "" {
            Data.instance
        }
    }
    
}

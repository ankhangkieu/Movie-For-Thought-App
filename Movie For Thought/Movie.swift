//
//  Movie.swift
//  Movie For Thought
//
//  Created by Ak Kieu on 1/22/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import Foundation
import UIKit

class Movie: NSObject, NSCoding{
    private var _name: String!
    private var _imdb: String!
    private var _desc: String!
    private var _img: UIImage!
    
    init(name: String, imdb: String, desc: String, imgPath: String){
        _name = name
        _imdb = imdb
        _desc = desc
        _img = UIImage(named: imgPath)
    }
    
    override init(){
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
    }
}

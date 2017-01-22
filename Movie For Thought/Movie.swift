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
    private var _imgPath: String!
    
    var name: String{
        return _name
    }
    var imdb: String{
        return _imdb
    }
    var desc: String {
        return _desc
    }
    var imgPath: String{
        return _imgPath
    }
    
    init(name: String, imdb: String, desc: String, imgPath: String){
        _name = name
        _imdb = imdb
        _desc = desc
        _imgPath = imgPath
    }
    
    override init(){
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._name = aDecoder.decodeObjectForKey("name") as? String
        self._imgPath = aDecoder.decodeObjectForKey("imgPath") as? String
        self._desc = aDecoder.decodeObjectForKey("description") as? String
        self._imdb = aDecoder.decodeObjectForKey("imdb") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._name, forKey: "name")
        aCoder.encodeObject(self._imgPath, forKey: "imgPath")
        aCoder.encodeObject(self._desc, forKey: "desc")
        aCoder.encodeObject(self._imdb, forKey: "imdb")
    }
}

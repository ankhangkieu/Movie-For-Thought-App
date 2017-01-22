//
//  Data.swift
//  Movie For Thought
//
//  Created by Ak Kieu on 1/22/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import Foundation
import UIKit

class Data{
    static let instance = Data()
    private var _movies = [Movie]()
    
    var movies: [Movie]{
        return _movies
    }
    
    func addMovie(movie: Movie){
        _movies.append(movie)
    }
    
    
    
}

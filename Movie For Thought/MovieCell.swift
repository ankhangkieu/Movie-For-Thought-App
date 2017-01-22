//
//  MovieCell.swift
//  Movie For Thought
//
//  Created by Ak Kieu on 1/22/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell{
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var viewMovie: UIButton!
    
    func configureCell(movie: Movie){
        img.image = movie.img
        name.text = movie.name
        desc.text = movie.desc
        imdb.text = movie.imdb
    }
    
    @IBAction func viewMoviePressed(sender: AnyObject) {
        
    }
}

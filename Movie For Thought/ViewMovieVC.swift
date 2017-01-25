//
//  ViewMovieVC.swift
//  Movie For Thought
//
//  Created by Ak Kieu on 1/22/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import UIKit

class ViewMovieVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImdb: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var link: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let movie = Data.instance.movies[Data.instance.currentMovieIndex]
        img.image = Data.instance.imageForPath(movie.imgPath)
        movieName.text = movie.name
        movieDesc.text = movie.desc
        movieImdb.text = "imdb: " + movie.imdb
        link.setTitle(movie.link, forState: .Normal)
        if let title = link.currentTitle where title != "" {
            link.userInteractionEnabled = false
        }
    }
    
    @IBAction func onDeleteBtnPressed(sender: AnyObject) {
        Data.instance.deleteMovie()
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onBackBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onLinkPressed(sender: UIButton) {
        Data.instance.setCurrentLink(sender.currentTitle!)
    }
}

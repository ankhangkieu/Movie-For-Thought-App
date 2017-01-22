//
//  AddMovieVC.swift
//  Movie For Thought
//
//  Created by Ak Kieu on 1/22/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import UIKit

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieImdb: UITextField!
    @IBOutlet weak var movieName: UITextField!
    @IBOutlet weak var img: UIImageView!
    var imgPicker: UIImagePickerController!
    
    let DEFAULT_IMAGE = "QuestionMark"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        
        img.layer.cornerRadius = 5.0
        img.clipsToBounds = true
    }

    @IBAction func createNewPressed(sender: AnyObject) {
        if let imdb = movieImdb.text, let desc = movieDesc.text, let name = movieName.text{
            if img.image == nil{
                img.image = UIImage(named: DEFAULT_IMAGE)
            }
            let movie = Movie(name: name, imdb: imdb, desc: desc, imgPath: "")
            Data.instance.addMovie(movie)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

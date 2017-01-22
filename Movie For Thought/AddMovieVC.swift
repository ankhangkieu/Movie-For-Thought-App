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
    @IBOutlet weak var imdbLink: UITextField!
    var imgPicker: UIImagePickerController!
    
    let DEFAULT_IMAGE = "QuestionMark"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        
        img.layer.cornerRadius = img.frame.width/2
        img.clipsToBounds = true
    }

    @IBAction func onAddBtnPressed(sender: AnyObject) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func createNewPressed(sender: AnyObject) {
        if let imdb = movieImdb.text, let desc = movieDesc.text, let name = movieName.text, let link = imdbLink.text where name != "" && imdb != "" && desc != ""{
            if img.image == nil{
                img.image = UIImage(named: DEFAULT_IMAGE)
            }
            let imgPath = Data.instance.saveImageAndCreatePath(img.image!)
            let movie = Movie(name: name, imdb: imdb, desc: desc, imgPath: imgPath, link: link)
            Data.instance.addMovie(movie)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        dismissViewControllerAnimated(true, completion: nil)
        img.image = image
    }
}

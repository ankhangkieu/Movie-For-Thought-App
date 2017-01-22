//
//  Data.swift
//  Movie For Thought
//
//  Created by Ak Kieu on 1/22/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import Foundation
import UIKit

class Data {
    static let instance = Data()
    private var _movies = [Movie]()
    private var _currentMovieIndex: Int!
    
    let KEY_MOVIE = "movies"
    
    var movies: [Movie]{
        return _movies
    }
    var currentMovieIndex: Int{
        return _currentMovieIndex
    }
    
    func setCurrentMovieIndex(index: Int){
        _currentMovieIndex = index
    }
    
    func saveMovies(){
        let movieData = NSKeyedArchiver.archivedDataWithRootObject(_movies)
        NSUserDefaults.standardUserDefaults().setObject(movieData, forKey: KEY_MOVIE)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadMovies(){
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(KEY_MOVIE) as? NSData{
            if let movieData = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Movie]{
                _movies = movieData
            }
        }
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "dataLoaded", object: nil))
    }
    
    func addMovie(movie: Movie){
        _movies.append(movie)
        saveMovies()
        loadMovies()
    }
    
    func deleteMovie(){
        _movies.removeAtIndex(self._currentMovieIndex)
        saveMovies()
        loadMovies()
    }
    
    func saveImageAndCreatePath(img: UIImage)->String{
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let imgData = UIImagePNGRepresentation(img)
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func documentsPathForFileName(filename: String)->String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingString(filename)
    }
    
    func imageForPath(imgPath: String)->UIImage{
        let fullPath = documentsPathForFileName(imgPath)
        return UIImage(named: fullPath)!
    }
}

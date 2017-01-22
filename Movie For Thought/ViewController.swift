//
//  ViewController.swift
//  Movie For Thought
//
//  Created by Ak Kieu on 1/22/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.onMoviesLoaded(_:)), name: "dataLoaded", object: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        Data.instance.loadMovies()
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let movie = Data.instance.movies[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell{
            cell.configureCell(movie, index: indexPath.row)
            return cell
        }
        else{
            let cell = MovieCell()
            cell.configureCell(movie, index: indexPath.row)
            return cell
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.instance.movies.count
    }
    
    func onMoviesLoaded(notif: AnyObject){
        tableView.reloadData()
    }
}


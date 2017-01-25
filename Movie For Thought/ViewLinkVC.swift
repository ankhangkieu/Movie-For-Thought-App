//
//  ViewLinkVC.swift
//  Movie For Thought
//
//  Created by Ak Kieu on 1/23/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class ViewLinkVC: UIViewController {
    @IBOutlet weak var container: UIView!
    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = UIWebView()
        container.addSubview(webView)
    }
    
    override func viewDidAppear(animated: Bool) {
        webView.frame = CGRect(x: 0, y: 0, width: container.bounds.width, height: container.bounds.height)
        loadRequest(Data.instance.currentLink)
    }
    
    func loadRequest(link: String){
        let url = NSURL(string: link)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    @IBAction func onCancelPressed(sender: AnyObject){
        dismissViewControllerAnimated(true, completion: nil)
    }
}

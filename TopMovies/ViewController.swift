//
//  ViewController.swift
//  TopMovies
//
//  Created by Christos Baloukas on 26/4/16.
//  Copyright © 2016 Christos Baloukas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmovies/limit=10/genre=4401/json")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  APIManager.swift
//  TopMovies
//
//  Created by Christos Baloukas on 26/4/16.
//  Copyright © 2016 Christos Baloukas. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString: String) -> Void {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let url = NSURL(string: urlString)!
        let task = session.dataTaskWithURL(url) { (data, response, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            } else {
                self.parseMovies(data!)
                /*dispatch_async(dispatch_get_main_queue(), {
                    completion(result: movies)
                })*/
            }
        }
        task.resume()
    }
    
    func parseMovies(data: NSData) -> [Movie] {
        do {
            
            if let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as AnyObject? {
                JSONParser.parseJSON(json, parsingKeys: ["im:name/label", "im:name/name"])
            }
        }
        catch {
            print("NSJSON serialization error:\(error)")
        }
        
        return [Movie]()
    }
    
}
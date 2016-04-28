//
//  JSONParser.swift
//  TopMovies
//
//  Created by Christos Baloukas on 26/4/16.
//  Copyright © 2016 Christos Baloukas. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: AnyObject]

typealias JSONArray = Array<AnyObject>

let example = "im:name/2/label"


class JSONParser {
    
    static func parseJSON(data: AnyObject, parsingKeys: [String]) -> AnyObject? {
        
        let jsonStringComponents = parsingKeys[0].componentsSeparatedByString("/")
        var returnValue: AnyObject?
        
        if jsonStringComponents.count > 0 {
            print(jsonStringComponents)
            
            var newData = data
            
            print(data)
            
            for key in jsonStringComponents {
                switch newData {
                case let value as JSONDictionary:
                    newData = value["test"]!
                case let value as JSONArray:
                    let intKeyValue = Int(key)
                    newData = value[intKeyValue!]
                case is String:
                    returnValue = newData
                case is Int:
                    returnValue = newData
                default:
                    print("nil")
                }
                print(key)
                print(data[key])
                //newDataPart = initialDataPart[key]
                
            }
        }
        return returnValue
    }
}
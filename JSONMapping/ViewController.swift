//
//  ViewController.swift
//  JSONMapping
//
//  Created by Matthew Pileggi on 12/16/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import UIKit
import Gloss

class ViewController: UIViewController {

    @IBOutlet weak var io: UITextView!
    
    var jsons: [JSON]?
    
    var model: [Tab]?
    
    @IBAction func initialize() {
        model = [Tab]()
        
        model!.append(Tab())
        model!.append(Tab())
    }
    
    //turn tab into json
    @IBAction func serialize() {
        
        if let tabs = model {
            jsons = tabs.toJSONArray()
            io.text = jsons?.description
        } else {
            io.text = "UNITIALIZED MODEL"
        }
    }

    //turn json into tab
    @IBAction func deserialize() {
        if let jsons = jsons {
            model = [Tab].from(jsonArray: jsons)
            io.text = model?.description
        } else {
            io.text = "UNITIALIZED JSON"
        }
        
    }
    

}



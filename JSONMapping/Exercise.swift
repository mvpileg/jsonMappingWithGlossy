//
//  Exercise.swift
//  JSONMapping
//
//  Created by Matthew Pileggi on 12/16/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import Gloss

class Exercise: Glossy {
    
    let name: String
    let sets: [String]
    
    init(){
        name = "EXAMPLE EXERCISE"
        sets = ["one", "two", "three"]
    }
    
    //Deserialization
    required init?(json: JSON){
        
        guard
            let name: String = "name" <~~ json,
            let sets: [String] = "sets" <~~ json
        else {
            return nil
        }
        
        self.name = name
        self.sets = sets
        
    }
    
    //Serialization
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name,
            "sets" ~~> self.sets
        ])
    }
    
}

extension Exercise: CustomStringConvertible {
    public var description: String {
        get {
            var returnable = ""
            returnable += "Exercise: \(name)\n"
            returnable += "Sets: \(sets)\n\n"
            return returnable
        }
    }
}

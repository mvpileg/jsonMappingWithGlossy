//
//  Page.swift
//  JSONMapping
//
//  Created by Matthew Pileggi on 12/16/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import Gloss

class Page: Glossy {
    
    var name: String
    var exercises: [Exercise]
    
    init(){
        
        name = "TEST PAGE"
        exercises = [Exercise]()
        
        exercises.append(Exercise())
        exercises.append(Exercise())
        exercises.append(Exercise())

    }
    
    //Deserialization
    required init?(json: JSON){
        guard
            let name: String = "name" <~~ json,
            let exercises: [Exercise] = "exercises" <~~ json
            else {
                return nil
        }
        
        self.name = name
        self.exercises = exercises
    }
    
    //Serialization
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name,
            "exercises" ~~> self.exercises
            ])
    }
    
}

extension Page: CustomStringConvertible {
    public var description: String {
        get {
            var returnable = ""
            returnable += "Page:\t\(name)\n"
            returnable += "Exercises:\t\(exercises)\n"
            return returnable
        }
    }
}

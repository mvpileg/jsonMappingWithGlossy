//
//  Tab.swift
//  JSONMapping
//
//  Created by Matthew Pileggi on 12/16/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import Gloss

class Tab: Glossy {
    
    var name: String
    var pages: [Page]
    
    init(){
        
        name = "EXAMPLE TAB"
        
        pages = [Page]()
       
        pages.append(Page())
        pages.append(Page())
        pages.append(Page())

    }
    
    //Deserialization
    required init?(json: JSON){
        guard
            let name: String = "name" <~~ json,
            let pages: [Page] = "pages" <~~ json
            else {
                return nil
        }
        
        self.name = name
        self.pages = pages
    }
    
    //Serialization
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name,
            "pages" ~~> self.pages
            ])
    }
    
    
}

extension Tab: CustomStringConvertible {
    public var description: String {
        get {
            var returnable = ""
            returnable += "Tab:\t\(name)\n"
            returnable += "Pages:\t\(pages)\n"
            return returnable
        }
    }
}


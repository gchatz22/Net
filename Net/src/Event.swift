//
//  Post.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/16/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import Foundation

class Event: Codable{
    
    var uid: String
    var content: String
    var owner: User
    var location: Location
    
    init(content: String, owner: User, location: Location, uid: String){
        self.uid = uid
        self.content = content
        self.owner = owner
        self.location = location
    }
    
    static func createEventWith(params: [String: Any], uid: String) -> Event{
        let keys = params.keys
        if (!(keys.contains("uid") && keys.contains("content") && keys.contains("owner") && keys.contains("location"))){
            assert(false, "Missing parameters to create event")
        }
        return Event(content: params["content"] as! String, owner: params["owner"] as! User, location: params["location"] as! Location, uid: uid)
    }
    
    func setContent(content: String){
        self.content = content
    }
    
    func setUser(owner: User){
        self.owner = owner
    }
    
    func setLocation(location: Location){
        self.location = location
    }
    
    
}

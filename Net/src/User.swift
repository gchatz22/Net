//
//  File.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/16/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import Foundation

class User: NSObject, NSSecureCoding, Codable{
    
    static var supportsSecureCoding: Bool = true
    
    var uid: String
    var username: String
    var email: String
    var name: String
    var location: Location
    
//    static func newEmptyUser() -> User{
//        return User(uid: "nil", username: "", email: "", name: "", location: Location(latitude: -1, longitude: -1))
//    }
    
    static func createUserWith(params: [String: Any], uid: String) -> User{
        let keys = params.keys
        if (!(keys.contains("username") && keys.contains("email") && keys.contains("name") && keys.contains("location"))){
            assert(false, "Missing parameters to create user")
        }
        return User(uid: uid, username: params["username"]! as! String, email: params["email"]! as! String, name: params["name"]! as! String, location: params["location"]! as! Location)
    }
    
    init(uid: String, username: String, email: String, name: String, location: Location){
        self.uid = uid
        self.username = username
        self.email = email
        self.name = name
        self.location = location
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(uid, forKey: "uid")
        coder.encode(username, forKey: "username")
        coder.encode(email, forKey: "email")
        coder.encode(name, forKey: "name")
        coder.encode(location, forKey: "location")
    }
    
    required convenience init?(coder: NSCoder) {
        let uid = coder.decodeObject(forKey: "uid") as! String
        let username = coder.decodeObject(forKey: "username") as! String
        let email = coder.decodeObject(forKey: "email") as! String
        let name = coder.decodeObject(forKey: "name") as! String
        let location = coder.decodeObject(of: Location.self, forKey: "location")
        self.init(uid: uid, username: username, email: email, name: name, location: location!)
    }
    
    enum CodingKeys: String, CodingKey {
        case uid
        case username
        case email
        case name
        case location
    }
}

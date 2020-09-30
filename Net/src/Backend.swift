//
//  Backend.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/15/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import MapKit

class Backend{
    
    static public var user: User = getUser()
    static private var db = Firestore.firestore()
    
    static public var defaultLatMeters: Double = 100
    static public var defaultLonMeters: Double = 100
    
//    func getEvents -> [Event]{
//
//        return
//    }
    
    static func createAndStroreEvent(params: [String: Any]){
        let uid = UUID().uuidString
        let event = Event.createEventWith(params: params, uid: uid)
        let eventDoc = createRef(collection: "events", uid: uid)
        do {
            try eventDoc.setData(from: event)
        } catch let error {
            print("Error writing user to Firestore: \(error)")
        }
    }
    
    static func createAndStroreUser(params: [String: Any]){
        // create user
        let uid = UUID().uuidString // the auth uid will be used instead of a random one
        let user = User.createUserWith(params: params, uid: uid)
        print(user.location)
        
        // store user in User.defaults
        do{
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: true)
            UserDefaults.standard.set(encodedData, forKey: "user")
            print("Created and stored user")
        } catch{
            print(error)
            assert(false, "Could not store new user in User.defaults")
        }
        
        // store user online
        let userDoc = self.createRef(collection: "users", uid: uid)
        do {
            try userDoc.setData(from: user)
        } catch let error {
            print("Error writing user to Firestore: \(error)")
        }
    }
    
    static func getUser() -> User{
        let decoded = UserDefaults.standard.data(forKey: "user")
        if (decoded == nil){assert(false, "User not found in User.defaults")}
        
        do{
            let user = try NSKeyedUnarchiver.unarchivedObject(ofClass: User.self, from: decoded!)
            return user!
        } catch{
            print(error)
            assert(false, "Could not unarchive user")
        }
    }
    
    static func createRef(collection: String, uid: String) -> DocumentReference{
        return db.collection(collection).document(uid)
    }
}

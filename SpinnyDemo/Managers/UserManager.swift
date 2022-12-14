//
//  UserManager.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 10/08/22.
//

import Foundation
import RealmSwift

class UserManager {
    static var shared = UserManager()
    var currentUser: User? {
        get {
            guard let username = currentLoggedInUserName else { return nil }
            return RealmManager.shared.realm.objects(User.self).filter("username == %@", username).first
        }
    }
    var currentLoggedInUserName: String? {
        get {
            UserDefaults.standard.object(forKey: "UserManager.current.user.name") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "UserManager.current.user.name")
        }
    }
    
    func saveUserToDB(user: User) {
        RealmManager.shared.saveObject(objs: user)
    }
    
    func deleteUserFromDB() {
        if let user = RealmManager.shared.realm.objects(User.self).first {
            RealmManager.shared.deleteObject(obj: user)
        }
    }
    
    func getUser(username: String, password: String) -> User? {
        let user = RealmManager.shared.realm.objects(User.self).filter("username == %@ && password == %@", username,password).first
        return user
    }
    
}

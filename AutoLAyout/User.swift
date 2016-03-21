//
//  User.swift
//  AutoLAyout
//
//  Created by SunDiz on 16/3/21.
//  Copyright © 2016年 SunDiz. All rights reserved.
//

import Foundation

struct User {
    let name:String
    let company:String
    let login:String
    let password:String
    
    static func login(login:String, password:String) -> User? {
        if let user = database[login]{
            if user.password == password{
                return user
            }
        }
        return nil
    }
    
    static let database:Dictionary<String, User> = {
        var theDatabase = Dictionary<String, User>()
        for user in [
            User(name: "dizsun", company: "dizsun", login: "dizsun", password: "123456"),
            User(name: "zhang san", company: "Apple", login: "zsan", password: "123456")
            ]{
                theDatabase[user.login] = user
        }
        return theDatabase
    }()
}

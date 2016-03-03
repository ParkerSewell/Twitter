//
//  User.swift
//  Twitter
//
//  Created by Parker Sewell on 2/17/16.
//  Copyright © 2016 Parker Sewell. All rights reserved.
//

import UIKit

var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"

class User: NSObject {
    var name: String?
    var screenname: String!
    var profileImageUrl: String?
    var tagline: String?
    var dictionary: NSDictionary
    var followers: Int?
    var following: Int?
    
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as! String
        profileImageUrl = dictionary["profile_image_url"] as? String
        tagline = dictionary["description"] as? String
        followers = dictionary["followers_count"] as? Int
        following = dictionary["friends_count"] as? Int
    }
    
    func logout() {
        User.currentUser = nil
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
        
    }
    
    class var currentUser: User? {
        get {
        if (_currentUser == nil) {
        var data = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData
        if (data != nil) {
        var dictionary = try?NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
        _currentUser = User(dictionary: dictionary!)
        }
        }
        return _currentUser
        }
        set(user) {
            
            _currentUser = user
            
            if _currentUser != nil {
                do {
                    let data = try?NSJSONSerialization.dataWithJSONObject((user?.dictionary)!, options: .PrettyPrinted)
                    NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
                    NSUserDefaults.standardUserDefaults().synchronize()
                }
            } else {
                NSUserDefaults.standardUserDefaults().setObject(nil, forKey: currentUserKey)
                NSUserDefaults.standardUserDefaults().synchronize()
            }
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    
}

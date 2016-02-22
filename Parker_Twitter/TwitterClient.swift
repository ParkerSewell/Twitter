//
//  TwitterClient.swift
//  Parker_Twitter
//
//  Created by Parker Sewell on 2/16/16.
//  Copyright © 2016 Parker Sewell. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "bsPTeiMbxjmhB4PwrOYP9uIQa"
let twitterConsumerSecret = "2ndslYV9sR5Tv77ElnveTCcE2ZPvsePV1vvqARghFRx4w1BsrL"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")


class TwitterClient: BDBOAuth1SessionManager {
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }

}

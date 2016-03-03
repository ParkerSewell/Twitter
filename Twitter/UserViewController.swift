//
//  UserViewController.swift
//  Twitter
//
//  Created by Parker Sewell on 2/17/16.
//  Copyright © 2016 Parker Sewell. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    

    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var userName: UILabel!

    @IBOutlet weak var twitterHandle: UILabel!
   
    @IBOutlet weak var profileDescription: UILabel!
    
    @IBOutlet weak var followersCount: UILabel!
    
    @IBOutlet weak var followingCount: UILabel!
    
    
    var tweet: Tweet!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thumbImageView.setImageWithURL(NSURL(string: (tweet.user?.profileImageUrl!)!)!)
        userName.text = tweet.user!.name!
        twitterHandle.text = "@\(tweet.user!.screenname!)"
        profileDescription.text = tweet.user?.tagline!
        if(tweet.user?.followers! > 999 && tweet.user?.followers! < 1000000){
            followersCount.text = String("\(Double((tweet.user?.followers!)!/1000))k")
        }else if tweet.user?.followers! >= 1000000 {
            followersCount.text = String("\(Double((tweet.user?.followers!)!/1000000))M")
        }else{
            followersCount.text = String(tweet.user?.followers!)
        }
        
        
        followingCount.text = String(tweet!.user!.following!)
        
        
    }


        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

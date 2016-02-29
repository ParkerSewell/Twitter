//
//  ComposeViewController.swift
//  Twitter
//
//  Created by Parker Sewell on 2/29/16.
//  Copyright © 2016 Camden Developers. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tweetText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                profileImage.setImageWithURL(NSURL(string: User.currentUser!.profileImageUrl!)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelTweetButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func tweetButtonPressed(sender: AnyObject) {
        let text = tweetText.text!
        
        // Post this tweet!!
        TwitterClient.sharedInstance.postTweet(text,
            completion: {(tweet,error) -> () in
                self.dismissViewControllerAnimated(true, completion: nil)

    })
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

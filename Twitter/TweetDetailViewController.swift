//
//  TweetDetailViewController.swift
//  Twitter
//
//  Created by Parker Sewell on 2/17/16.
//  Copyright © 2016 Parker Sewell. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var tweet: Tweet!
    var tweetID: NSNumber?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(tweet)
        
        // Do any additional setup after loading the view.
       
        tweetTextLabel.text = tweet.text
        thumbImageView.setImageWithURL(NSURL(string: tweet.user!.profileImageUrl!)!)
        nameLabel.text = tweet.user!.name!
        screennameLabel.text = "@\(tweet.user!.screenname!)"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "M/d/yy, h:mm a" //format style. Browse online to get a format that fits your needs.
        let dateString = dateFormatter.stringFromDate(tweet.createdAt!)
        timeLabel.text = dateString
        
        replyButton.setImage(UIImage(named: "tweet_reply"), forState: .Normal)
        retweetButton.setImage(UIImage(named: "tweet_retweet"), forState: .Normal)
        favoriteButton.setImage(UIImage(named: "tweet_like"), forState: .Normal)
        retweetCountLabel.text = String(tweet.retweet_count!)
        favoriteCountLabel.text = String(tweet.favorite_count!)
        
        tweetID = tweet.id
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func replyButtonPressed(sender: AnyObject) {
        print("Reply button pressed")
        
    }
   
    @IBAction func retweetButtonPressed(sender: AnyObject) {
        print("Retweet button clicked")
        
        TwitterClient.sharedInstance.retweetWithCompletion(["id": tweetID!]) { (tweet, error) -> () in
            
            if (tweet != nil) {
                
                self.retweetButton.setImage(UIImage(named: "retweet-action-on-green.png"), forState: UIControlState.Normal)
                
                if self.retweetCountLabel.text! > "0" {
                    self.retweetCountLabel.text = String(self.tweet!.retweet_count! + 1)
                } else {
                    self.retweetCountLabel.hidden = false
                    self.retweetCountLabel.text =
                        String(self.tweet!.retweet_count! + 1)
                }
                
            }
            else {
                print("ERROR retweeting: \(error)")
            }
        }
    }
    
    @IBAction func favoriteButtonPressed(sender: AnyObject) {
        print("Like button clicked")
        
        TwitterClient.sharedInstance.favoriteWithCompletion(["id": tweetID!]) { (tweet, error) -> () in
            
            if (tweet != nil) {
                
                self.favoriteButton.setImage(UIImage(named: "like-action-on-red.png"), forState: UIControlState.Normal)
                
                if self.favoriteCountLabel.text! > "0" {
                    self.favoriteCountLabel.text = String(self.tweet.favorite_count! + 1)
                } else {
                    self.favoriteCountLabel.hidden = false
                    self.favoriteCountLabel.text = String(self.tweet.favorite_count! + 1)
                }
                
            }
            else {
                print("Did it print the print fav tweet? cause this is the error message and you should not be seeing this.")
            }
        }
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

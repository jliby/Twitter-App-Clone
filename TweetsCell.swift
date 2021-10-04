//
//  TweetsCell.swift
//  Twitter
//
//  Created by James  Luberisse on 9/26/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetsCell: UITableViewCell {
    @IBOutlet weak var tweetsContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
  
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    @IBAction func favAction(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did no succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })       }
    }
    @IBAction func retweetAction(_ sender: Any) {
        
        TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: {(error) in print("Error is retweeting: \(error)")})
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        if(isRetweeted) {
             retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
             retweetButton.isEnabled = false
         } else {
             retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
             retweetButton.isEnabled = true
         }
    }
    
    

    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if( favorited) {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named:"favor-icon-2"), for: UIControl.State.normal)        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

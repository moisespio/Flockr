//
//  FeedManager.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 24/08/15.
//  Copyright (c) 2015 flockr. All rights reserved.
//

import UIKit
import Parse

class Feed {
    var profile: Profile!
    var follow: Follow!
    var photo: Photo!
    var like: Like!
 

    init(dictionary: [String:AnyObject]) {

        self.profile = dictionary["profile"] as? Profile
        self.follow = dictionary["follow"] as? Follow
        self.photo = dictionary["photo"] as? Photo
        self.like = dictionary["like"] as? Like
    }
 

    static func load(page: Int, callback: @escaping (_ photos: [Feed], _ error: NSError?) -> ()) {
        PFCloud.callFunction(inBackground: "getFeed", withParameters: ["profileId" : "Fwqq62m7ty", "page" : page]) { (response, error) -> Void in

            if let error = error {
                callback([], error as NSError?)
            } else {
                var photos : [Feed] = []
                if let allPhotos = response as? [[String:AnyObject]] {
                    for obj in allPhotos {
                        let feedControl = Feed(dictionary: obj)
                        
                        photos.append(feedControl)
                    }
                }

                callback(photos, nil)
            }
        }
    }
}

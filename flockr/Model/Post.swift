//
//  Post.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 24/11/16.
//  Copyright (c) 2016 flockr. All rights reserved.
//

import UIKit
import Parse

class Post {
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
 
    static func load(page: Int, callback: @escaping (_ photos: [Post], _ error: NSError?) -> ()) {
        PFCloud.callFunction(inBackground: "getFeed", withParameters: ["profileId" : "2sJk4lsExj", "page" : page]) { (response, error) -> Void in

            if let error = error {
                callback([], error as NSError?)
            } else {
                var photos : [Post] = []
                if let allPhotos = response as? [[String:AnyObject]] {
                    for obj in allPhotos {
                        let feedControl = Post(dictionary: obj)
                        
                        photos.append(feedControl)
                    }
                }

                callback(photos, nil)
            }
        }
    }
}

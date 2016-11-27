//
//  LikeManager.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 17/07/15.
//  Copyright (c) 2015 flockr. All rights reserved.
//

import UIKit
import Parse

class Like: PFObject, PFSubclassing {
    static var className : String = "Likes"
    
    // MARK: - Managed PFSubclassing
    override class func initialize() {
        self.registerSubclass()
    }
    class func parseClassName() -> String {
        return Like.className
    }

    @NSManaged var photo: Photo?
    @NSManaged var profile: Profile?
}

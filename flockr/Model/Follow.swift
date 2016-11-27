//
//  FollowManager.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 17/07/15.
//  Copyright (c) 2015 flockr. All rights reserved.
//

import UIKit
import MobileCoreServices
import Parse

class Follow: PFObject, PFSubclassing {
    static var className : String = "Follow"
    
    // MARK: - Managed PFSubclassing
    override class func initialize() {
        self.registerSubclass()
    }
    class func parseClassName() -> String {
        return Follow.className
    }

    @NSManaged var following: Profile?
    @NSManaged var profile: Profile?
    @NSManaged var followed: NSNumber?
    
}

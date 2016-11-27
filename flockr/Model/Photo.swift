//
//  PhotoManager.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 17/07/15.
//  Copyright (c) 2015 flockr. All rights reserved.
//

import UIKit
import Parse

class Photo: PFObject, PFSubclassing {
    static var className : String = "Photos"
    
    // MARK: - Managed PFSubclassing
    override class func initialize() {
        self.registerSubclass()
    }
    class func parseClassName() -> String {
        return Photo.className
    }

    @NSManaged var caption: String?
    @NSManaged var commentCount: NSNumber?
    @NSManaged var likeCount: NSNumber?
    @NSManaged var photo: PFFile?
    @NSManaged var location: PFGeoPoint?
    @NSManaged var profile: Profile?

    var active: Bool {
        get {
            if let active = self["active"] as? Bool {
                return active
            } else {
                return true
            }
        }
        set { self["active"] = newValue }
    }
}

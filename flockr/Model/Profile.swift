//
//  ProfileManager.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 17/07/15.
//  Copyright (c) 2015 flockr. All rights reserved.
//

import UIKit
import Parse

class Profile: PFObject, PFSubclassing {
    static var className : String = "Profiles"
    
    // MARK: - Managed PFSubclassing
    override class func initialize() {
        self.registerSubclass()
    }
    class func parseClassName() -> String {
        return Profile.className
    }

    @NSManaged var name: String?
    @NSManaged var nickname: String?
    @NSManaged var birthDate: NSDate?
    @NSManaged var profileImage: PFFile?

    /*@NSManaged var species: SpecieManager?
    @NSManaged var breed: BreedManager?
    @NSManaged var user: UserManager?*/

    @NSManaged var followedCount: NSNumber?
    @NSManaged var followingCount: NSNumber?
    
    var finalQuery : PFQuery! = nil
    
//    var active: Bool?
}

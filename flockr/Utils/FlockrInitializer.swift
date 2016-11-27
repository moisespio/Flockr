//
//  FlockrInitializer.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 27/11/16.
//  Copyright © 2016 flockr. All rights reserved.
//

import UIKit
import Parse

class FlockrInitializer: NSObject {
    
    class func startParseWithLaunchOptions(_ launchOptions: [AnyHashable: Any]?) {
        Profile.initialize()
        Photo.initialize()
        Follow.initialize()
        Like.initialize()
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = "XSZOLRwwnwXTE3MFeTtBDttdCUaaBTzVSOI0Wz2R"
            $0.clientKey = "YMbMSh5m7LCvOqwQ2y2xgHzycy1vEfeMlmTL8EWL"
        }
        
        Parse.initialize(with: configuration)
        /*
        
        //        Parse.setApplicationId(PARSE_APPLICATION_ID, clientKey: PARSE_CLIENT_KEY)
        PFAnalytics.trackAppOpened(launchOptions: launchOptions)
        PFFacebookUtils.initializeFacebook(applicationLaunchOptions: launchOptions)
        
        PFConfig.getInBackground()
     */
 
    }
    
    class func configurePushNotifications(_ application: UIApplication) {
        
        // Allow us to send silent pushes.
        application.registerForRemoteNotifications()
        
        // Allow us to send notifications and alerts.
        let userNotificationTypes: UIUserNotificationType = ([UIUserNotificationType.alert, UIUserNotificationType.badge, UIUserNotificationType.sound]);
        let settings = UIUserNotificationSettings(types: userNotificationTypes, categories: nil)
        application.registerUserNotificationSettings(settings)
        
    }
}

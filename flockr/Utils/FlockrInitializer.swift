//
//  FlockrInitializer.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 27/11/16.
//  Copyright © 2016 flockr. All rights reserved.
//

import UIKit

class FlockrInitializer: NSObject {
    
    class func startParseWithLaunchOptions(_ launchOptions: [AnyHashable: Any]?) {
        /*SPZNegotiation.registerSubclass()
        SPZNegotiationMessage.registerSubclass()
        SPZPlaceImage.registerSubclass()
        SPZRating.registerSubclass()
        SPZPlace.registerSubclass()
        SPZProposal.registerSubclass()
        SPZFavorite.registerSubclass()
        SPZUser.registerSubclass()
        SPZNegotiationHistory.registerSubclass()
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = "spotz"
            $0.clientKey = "spotzClientKey"
            //            $0.server = "http://localhost:1338/spotz" // $0.server = "http://172.16.1.5:1338/spotz"
            //            $0.server = "http://172.16.1.5:1338/spotz"
            $0.server = "http://ec2-54-191-28-37.us-west-2.compute.amazonaws.com:1338/spotz"
        }
        Parse.initialize(with: configuration)
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

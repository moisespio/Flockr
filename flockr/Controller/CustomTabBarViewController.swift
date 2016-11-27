//
//  CustomTabBarViewController.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 27/11/16.
//  Copyright © 2016 flockr. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var cameraButton: UIButton!
    
    // ViewControllers
    var feedViewController: UIViewController!
    var searchViewController: UIViewController!
    var activitiesViewController: UIViewController!
    var profileViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        cameraButton.layer.cornerRadius = 32
        cameraButton.layer.borderWidth = 5
        cameraButton.layer.borderColor = UIColor.white.cgColor
        cameraButton.layer.shadowRadius = 6
        cameraButton.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0, alpha: 0.2).cgColor
        cameraButton.layer.shadowOpacity = 1
        cameraButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        for button in buttons {
            button.layer.cornerRadius = 22
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.shadowRadius = 3
            button.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0, alpha: 0.2).cgColor
            button.layer.shadowOpacity = 1
            button.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
        
        let storyboard = UIStoryboard(name: "Feed", bundle: nil)
        feedViewController = storyboard.instantiateViewController(withIdentifier: "Feed")
        
        let storyboardSearch = UIStoryboard(name: "Search", bundle: nil)
        searchViewController = storyboardSearch.instantiateViewController(withIdentifier: "Search")
        
        let storyboardNotification = UIStoryboard(name: "Notification", bundle: nil)
        activitiesViewController = storyboardNotification.instantiateViewController(withIdentifier: "Notification")
        
        let storyboardProfile = UIStoryboard(name: "Profile", bundle: nil)
        profileViewController = storyboardProfile.instantiateViewController(withIdentifier: "Profile")
        
        viewControllers = [feedViewController, searchViewController, activitiesViewController, profileViewController]
        
        buttons[selectedIndex].isSelected = true
        tabBarButtonPressed(buttons[selectedIndex])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print(self)
    }
    
    @IBAction func tabBarButtonPressed(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        vc.didMove(toParentViewController: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

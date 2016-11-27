//
//  VStylist.swift
//  velivery
//
//  Created by Matheus Frozzi Alberton on 17/06/16.
//  Copyright © 2016 720. All rights reserved.
//

import UIKit

class FlockrStylist: NSObject {
    enum NavColors: String {
        case Feed = "#785BFF"
        case Default = "#1FC4CA"
        case Camera = "#FC3767"
    }

    class func applyAppeareance(color: NavColors) {
        UINavigationBar.appearance().barTintColor = UIColor(hexa: color.rawValue)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName : UIFont.customFontWithSize(18.0), NSForegroundColorAttributeName : UIColor.white]
        
        UITableViewCell.appearance().preservesSuperviewLayoutMargins = true
        UITableViewCell.appearance().contentView.preservesSuperviewLayoutMargins = true
    }

    class func insertLogoOnNavigationItem(_ navigationItem: UINavigationItem) {
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo-header")!)
    }
}

enum FlockrFontWeight : String {
    case Bold = "_bold"
    case Black = "_black"
    case Light = "_light"
}

extension UIFont {
    
    class func spotzFontWithSize(_ size: CGFloat, weight: FlockrFontWeight) -> UIFont {
        return UIFont(name: "Brandon\(weight.rawValue)", size: size)!
    }
    
}

extension UIColor {
    class func FlockrPurple() -> UIColor {
        return UIColor(hexa: "#785BFF")
    }
    
    class func FlockrGreen() -> UIColor {
        return UIColor(hexa: "#1FC4CA")
    }
    
    class func FlockrRed() -> UIColor {
        return UIColor(hexa: "#FC3767")
    }
}

//
//  VTools.swift
//  velivery
//
//  Created by Matheus Frozzi Alberton on 17/06/16.
//  Copyright © 2016 720. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(url: String, customLoader : Bool = false) {
        if customLoader{
            let imageData = NSData(contentsOf: Bundle.main.url(forResource: "loader", withExtension: "gif")!)
            self.kf.indicatorType = .image(imageData: imageData as! Data)
        } else {
            self.kf.indicatorType = .activity
        }

        let resource = URL(string: url)
        _ = self.kf.setImage(with: resource, placeholder: nil, options: [.transition(ImageTransition.fade(1))], progressBlock: nil, completionHandler: nil)
    }
}
extension UIColor {
    public convenience init(red255: CGFloat = 0, green255: CGFloat = 0, blue255: CGFloat = 0, alpha100:CGFloat = 100){
        self.init(red: red255/255.0, green: green255/255.0, blue: blue255/255.0, alpha: alpha100/100.0)
    }
    public convenience init(hexa: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        if hexa.hasPrefix("#") {
            let index   = hexa.characters.index(hexa.startIndex, offsetBy: 1)
            let hex     = hexa.substring(from: index)
            let scanner = Scanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexInt64(&hexValue) {
                switch (hex.characters.count) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
                }
            } else {
                print("Scan hex error")
            }
        } else {
            print("Invalid RGB string, missing '#' as prefix", terminator: "")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

extension CALayer {

    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        self.drawsAsynchronously = true
        
        let border = CALayer()

        switch edge {
            case UIRectEdge.top:
                border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
                break
            case UIRectEdge.left:
                border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
                break
            default:
                break
        }

        border.backgroundColor = color.cgColor;

        self.addSublayer(border)
    }
}

extension String {
    func Localized() -> String {
        return NSLocalizedString(self, comment:"")
    }

    func Spacing(_ size: CGFloat) -> NSMutableAttributedString {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        
        return NSMutableAttributedString(
            string: self,
            attributes: [NSFontAttributeName: UIFont.customFontWithSize(size), NSParagraphStyleAttributeName : style])
    }
}

extension Double {
    var asLocaleCurrency:String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.locale = Locale.current
        let val : String = formatter.string(for: self)!
        return val
    }
}

extension UIView {
    class func radius(_ radius : CGFloat, views: UIView...){
        for view in views{
            view.layer.masksToBounds = true
            view.layer.cornerRadius = radius
        }
    }
    class func border(_ width: CGFloat, color: UIColor, views: UIView...){
        for view in views{
            view.layer.masksToBounds = true
            view.layer.borderColor = color.cgColor
            view.layer.borderWidth = width
        }
    }
    func radius(_ radius : CGFloat? = nil){
        self.layer.drawsAsynchronously = true
        self.layer.masksToBounds = true
        if let radius = radius
        {
            self.layer.cornerRadius = radius
        }else{
            self.layer.cornerRadius = (self.frame.size.height < self.frame.size.width) ? self.frame.size.height / 2 : self.frame.size.width / 2
        }
    }
    func startActivity(_ blockScreen: Bool = false, animated: Bool = true){
        var view = self
        
        if blockScreen {
            view = UIView()
            view.tag = 999
            view.frame = self.bounds
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
            self.addSubview(view)
        }
        let viewActivityHolder = UIView(frame: CGRect(x: 0,y: 0,width: 50,height: 50))
        viewActivityHolder.tag = 998
        viewActivityHolder.frame = CGRect(x: (view.frame.size.width / 2) - (viewActivityHolder.frame.size.width / 2), y: (view.frame.size.height / 2) - (viewActivityHolder.frame.size.height / 2), width: viewActivityHolder.frame.size.width, height: viewActivityHolder.frame.size.height)
//        viewActivityHolder.backgroundColor = UIColor(red255: 0, green255: 0, blue255: 0, alpha100: 80)
        viewActivityHolder.radius(5)
        view.addSubview(viewActivityHolder)

        let activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
//        activity.color = UIColor.blackColor()
        activity.frame = CGRect(x: (viewActivityHolder.frame.size.width / 2) - (activity.frame.size.width / 2), y: (viewActivityHolder.frame.size.height / 2) - (activity.frame.size.height / 2), width: activity.frame.size.width, height: activity.frame.size.height)
        viewActivityHolder.addSubview(activity)
        activity.startAnimating()
        
        if animated {
            if blockScreen {
                view.alpha = 0
            }
            viewActivityHolder.alpha = 0
            viewActivityHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                
                if blockScreen {
                    view.alpha = 1
                }
                
                viewActivityHolder.alpha = 1
                viewActivityHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: { (completed) in
            })
        }
    }
    func stopActivityWithSuccess(_ completion: (()->())? = nil){
        DispatchQueue.main.async(execute: {
            
            UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                
                if let view = self.viewWithTag(999) {
                    if let viewN = view.viewWithTag(998) {
                        for v in viewN.subviews { v.alpha = 0 }
                        viewN.backgroundColor = UIColor.green
                    }
                }else if let view = self.viewWithTag(998) {
                    for v in view.subviews { v.alpha = 0 }
                    view.backgroundColor = UIColor.green
                }
                }, completion: { (completed) in
                    self.stopActivity(true, completion: completion)
            })
        })
    }
    func stopActivity(_ animated: Bool = true, completion: (()->())? = nil){
        DispatchQueue.main.async(execute: {
            let removeViews : ()->() = {
                if let view = self.viewWithTag(999) {
                    view.removeFromSuperview()
                }
                if let view = self.viewWithTag(998) {
                    view.removeFromSuperview()
                }
            }
            
            if animated {
                UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    
                    if let view = self.viewWithTag(999) {
                        view.alpha = 0
                        if let viewN = view.viewWithTag(998) {
                            viewN.alpha = 0
                            viewN.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                        }
                    }else if let view = self.viewWithTag(998) {
                        view.alpha = 0
                        view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    }
                    }, completion: { (completed) in
                        removeViews()
                        completion?()
                })
            } else {
                removeViews()
                completion?()
            }
        })
    }
}

extension String.Index{
    func successor(in string:String)->String.Index{
        return string.index(after: self)
    }
    
    func predecessor(in string:String)->String.Index{
        return string.index(before: self)
    }
    
    func advance(_ offset:Int, `for` string:String)->String.Index{
        return string.index(self, offsetBy: offset)
    }
}

extension UITextView {
    func chopOffNonAlphaNumericCharacters(text:String) -> String {
        let nonAlphaNumericCharacters = CharacterSet.alphanumerics.inverted
        let characterArray = text.components(separatedBy: nonAlphaNumericCharacters)
        return characterArray[0]
    }
    
    func resolveString(word: String) -> String {
        var stringifiedWord = word
        stringifiedWord.remove(at: stringifiedWord.startIndex)

        let caracter : String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"
        let cs : CharacterSet = CharacterSet(charactersIn: caracter).inverted
        
        let array:[String] = stringifiedWord.components(separatedBy: cs)

        stringifiedWord = array.reduce("", { (oldS:String, nString:String) -> String in
            return oldS+nString
        })
        
        return stringifiedWord
    }
    
    func resolveHashTags() {
        
        let schemeMap = [
            "#":"hash",
            "@":"mention"
        ]
        
        let nsText : String = self.text
        
        let words:[String] = nsText.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        
        let attrs = [
            NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSForegroundColorAttributeName : UIColor.lightGray
        ]
        
        let attrString = NSMutableAttributedString(string: nsText as String, attributes: attrs)
        
        for word in words {
            var scheme:String? = nil
            var prefix:String? = nil
            
            if word.hasPrefix("#") {
                scheme = schemeMap["#"]
                prefix = "#"
            } else if word.hasPrefix("@") {
                scheme = schemeMap["@"]
                prefix = "@"
            }
            
            if let scheme = scheme {
                var stringifiedWord:String = word as String

                stringifiedWord = prefix! + resolveString(word: stringifiedWord)
                if let _ = Int(stringifiedWord) {
                    // don't convert to hashtag if the entire string is numeric.
                } else if stringifiedWord.isEmpty {
                    // do nothing.
                } else {
                    let range = (nsText as NSString).range(of: stringifiedWord)
                    attrString.addAttribute(NSLinkAttributeName, value: "\(scheme):\(stringifiedWord)", range: range)
                }
            }
        }

        self.attributedText = attrString
    }
}

class Util {
    static func showAlert(_ title : String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))

        return alert
    }

    static func isValidEmail(_ testStr:String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    static func timeAgoSince(_ date: Date) -> String {
        
        let calendar = Calendar.current
        let now = Date()
        let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = (calendar as NSCalendar).components(unitFlags, from: date, to: now, options: [])
        
        if let year = components.year, year >= 2 {
            return "\(year) years ago"
        }
        
        if let year = components.year, year >= 1 {
            return "Last year"
        }
        
        if let month = components.month, month >= 2 {
            return "\(month) months ago"
        }
        
        if let month = components.month, month >= 1 {
            return "Last month"
        }
        
        if let week = components.weekOfYear, week >= 2 {
            return "\(week) weeks ago"
        }
        
        if let week = components.weekOfYear, week >= 1 {
            return "Last week"
        }
        
        if let day = components.day, day >= 2 {
            return "\(day) days ago"
        }
        
        if let day = components.day, day >= 1 {
            return "Yesterday"
        }
        
        if let hour = components.hour, hour >= 2 {
            return "\(hour) hours ago"
        }
        
        if let hour = components.hour, hour >= 1 {
            return "An hour ago"
        }
        
        if let minute = components.minute, minute >= 2 {
            return "\(minute) minutes ago"
        }
        
        if let minute = components.minute, minute >= 1 {
            return "A minute ago"
        }
        
        if let second = components.second, second >= 3 {
            return "\(second) seconds ago"
        }
        
        return "Just now"
        
    }
}

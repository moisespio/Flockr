//
//  FeedTableViewCell.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 27/11/16.
//  Copyright © 2016 flockr. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var petPostPhoto: UIImageView!
    @IBOutlet weak var petPostCaption: UITextView!
    @IBOutlet weak var petPostLikeCount: UIButton!
    @IBOutlet weak var petPostCommentCount: UIButton!
    @IBOutlet weak var petPostLikeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCellText(text:String){
        petPostCaption.delegate = self
        petPostCaption.text = text
        petPostCaption.linkTextAttributes = [NSForegroundColorAttributeName:UIColor.FlockrPurple()]
        petPostCaption.resolveHashTags()
    }
}

extension FeedTableViewCell : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        let scheme = URL.scheme
        let hash = URL.absoluteString

        switch scheme! {
        case "hash" :
            let finalHash = hash.substring(from: hash.startIndex.advance(8, for: hash))

            print("#" + finalHash)
        case "mention" :
            let finalHash = hash.substring(from: hash.startIndex.advance(8, for: hash))

            print(finalHash)
        default:
            print("just a regular url")
        }
        
        return true
    }
}

//
//  FeedViewController.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 27/11/16.
//  Copyright © 2016 flockr. All rights reserved.
//

import UIKit
import Kingfisher

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var posts : [Post] = []
    
    var skip : Int = 0
    var page : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 700
        
        loadFeed()
        //tableView.tableFooterView = loaderView
        
        //GoogleAnalytics.trackerViewName("Feed")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.FlockrPurple()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print(self)
    }

    //Functions
    func loadFeed() {
        Post.load(page: page) { (_Feed, error) in
            DispatchQueue.main.async(execute: {
                self.posts += _Feed
                self.tableView.reloadData()
            })
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let post = posts[section]
        
        if post.photo.caption == "" {
            return 2
        } else {
            return 3
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.section == skip+10-4) {
            skip = skip + 10
            page += 1
            self.loadFeed()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : FeedTableViewCell!
        
        let post = posts[indexPath.section]
        
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: FlockrCells.feedPhotoCell.rawValue, for: indexPath) as! FeedTableViewCell
            if let photo = post.photo, let file = photo.photo, let url = file.url {
                cell.petPostPhoto.setImage(url: url)
            }
        case 1 where tableView.numberOfRows(inSection: indexPath.section) == 2:
            cell = tableView.dequeueReusableCell(withIdentifier: FlockrCells.feedStatusCell.rawValue, for: indexPath) as! FeedTableViewCell
            //cell.contentView.layer.addBorder(.bottom, color: UIColor(hexa: "#F3F3F3"), thickness: 1)
            cell.petPostLikeCount.setTitle((post.photo.likeCount?.stringValue)! + " CURTIDAS", for: .normal)
            cell.petPostCommentCount.setTitle((post.photo.commentCount?.stringValue)!  + " COMENTÁRIOS", for: .normal)
            
            if let like = post.like {
                cell.petPostLikeButton.setImage(#imageLiteral(resourceName: "heart-selected"), for: .normal)
            } else {
                cell.petPostLikeButton.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
            }
        case 1 where tableView.numberOfRows(inSection: indexPath.section) == 3:
            cell = tableView.dequeueReusableCell(withIdentifier: FlockrCells.feedCaptionCell.rawValue, for: indexPath) as! FeedTableViewCell
            cell.setCellText(text: post.photo.caption!)
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: FlockrCells.feedStatusCell.rawValue, for: indexPath) as! FeedTableViewCell
            cell.contentView.layer.addBorder(.top, color: UIColor(hexa: "#F3F3F3"), thickness: 1)
            cell.petPostLikeCount.setTitle((post.photo.likeCount?.stringValue)! + " CURTIDAS", for: .normal)
            cell.petPostCommentCount.setTitle((post.photo.commentCount?.stringValue)!  + " COMENTÁRIOS", for: .normal)
            
            if let like = post.like {
                cell.petPostLikeButton.setImage(#imageLiteral(resourceName: "heart-selected"), for: .normal)
            } else {
                cell.petPostLikeButton.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
            }
        default:
            print("Oops")
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let cell = tableView.dequeueReusableCell(withIdentifier: FlockrCells.headerFeedCell.rawValue) as! HeaderFeedTableViewCell
        cell.petProfilePhoto.radius()
        
        let post = posts[section]

        cell.petProfileUsername.text = "@" + post.profile.nickname!
        if let profile = post.profile, let file = profile.profileImage, let url = file.url {
            cell.petProfilePhoto.setImage(url: url)
        }

        cell.petPostTimeAgo.text = Util.timeAgoSince(post.photo.createdAt!).uppercased()

        let header = cell.contentView
        //header.layer.addBorder(.bottom, color: UIColor(hexa: "#E5E5E5"), thickness: 1)
        //header.layer.addBorder(.top, color: UIColor(hexa: "#E5E5E5"), thickness: 1)
        
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    /*
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let photoControl = self.photos[indexPath.section].photo {
            let textView = UITextView()
            
            let attrs = [
                NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 15.0)!,
                NSForegroundColorAttributeName : UIColor.lightGrayColor()
            ]
            
            let attrString = NSMutableAttributedString(string: photoControl.caption!, attributes: attrs)
            
            textView.text = attrString.string
            textView.font = UIFont(name: "HelveticaNeue", size: 15.0)!
            
            let size = textView.sizeThatFits(CGSizeMake(self.view.frame.size.width - 16, CGFloat(Float.infinity)))
            if(photoControl.caption! == "") {
                //            size.height = size.height - 30.0
            }
            
            return self.view.frame.size.width + size.height + 44 + 16 + 20
        } else {
            return 700
        }
    }
    */
    
    func updateTableView() {
        //refreshControl.endRefreshing()
        tableView.reloadData()
        //activityIndicator.stopAnimating()
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

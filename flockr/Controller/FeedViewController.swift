//
//  FeedViewController.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 27/11/16.
//  Copyright © 2016 flockr. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 700
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlockrCells.feedCell.rawValue, for: indexPath)

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let cell = tableView.dequeueReusableCell(withIdentifier: FlockrCells.headerFeedCell.rawValue) as! HeaderFeedTableViewCell
        
        cell.petProfilePhoto.radius()

        let header = cell.contentView
        header.layer.addBorder(.bottom, color: UIColor(hexa: "#E5E5E5"), thickness: 1)
        header.layer.addBorder(.top, color: UIColor(hexa: "#E5E5E5"), thickness: 1)
        
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
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == Skip+10-4) {
            Skip = Skip + 10
            page += 1
            self.loadData(nil)
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

//
//  GagTableViewController.swift
//  Boluoboluomi
//
//  Created by 李志军 on 15/7/23.
//  Copyright (c) 2015年 lizhijun. All rights reserved.
//

import UIKit
import Alamofire
import IJReachability
import SDWebImage


class GagTableViewController: UITableViewController {
    
    var DataSource = NSMutableArray()
    var DataPage = 0
    
    var SegIndex = 0
    @IBAction func segChanged(sender: UISegmentedControl) {
        self.SegIndex = sender.selectedSegmentIndex
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.barTintColor = UIColor.darkGrayColor()
        //self.tableView.tableFooterView = UIView()
        
        if IJReachability.isConnectedToNetwork() {
            
            loadDataSource(self.SegIndex)
            self.tableView.header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "headerRefresh")
            self.tableView.footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: "footerRefresh")
        } else {
            ProgressHUD.showError("网络不可用")
        }

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 400
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as! CustomTableViewCell
        
        
        let gagItem = self.DataSource[indexPath.row] as! GagItem
        cell.titleLabel.text = gagItem.gagTitle as String
        
        //cell.detailTextLabel.text = gagItem.gagID as String
        
        let url = NSURL(string: gagItem.gagThumb as String)
        cell.thumbImageView?.sd_setImageWithURL(url, placeholderImage: UIImage(named: "default.png"))
        
        cell.scoreLabel.text = gagItem.gagScore as String + " 分"
        cell.commentsLabel.text = gagItem.gagComments as String + " 评论"
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func headerRefresh(){
        
        DataSource.removeAllObjects()
        self.DataPage = 0
        self.loadDataSource(self.DataPage)
        self.tableView.reloadData()
        self.tableView.header.endRefreshing()
    }
    
    func footerRefresh(){
        self.loadDataSource(++self.DataPage)
        self.tableView.footer.endRefreshing()
    }
    
    func loadDataSource(page:Int){
        
        Alamofire.request(.GET, "http://g.boluoboluomi.com/api/fresh?per_page=15&page_th=\(page)")
            .responseJSON { _, _, json, _ in
                //println(json!)
                let GagDataSource = json!["data"] as! NSArray
                var CurrentGagData = NSMutableArray()
                
                for currentGag:AnyObject in GagDataSource{
                    
                    let gagItem = GagItem()
                    gagItem.gagID = currentGag["id"] as! NSString
                    gagItem.gagGid = currentGag["gid"] as! NSString
                    gagItem.gagTitle = currentGag["title"] as! NSString
                    gagItem.gagScore = currentGag["score"] as! NSString
                    gagItem.gagComments = currentGag["comments"] as! NSString
                    gagItem.gagThumb = currentGag["small"] as! NSString
                    
                    self.DataSource.addObject(gagItem)
                }
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
        }
    }
}

//
//  ViewController.swift
//  NewsApplication
//
//  Created by Gourav Shukla on 16/08/17.
//  Copyright © 2017 Fishbowl. All rights reserved.
//


//https://newsapi.org





import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblView: UITableView!
     var newsArray = [AnyObject]()
    
    
      private let dataManager = ApiClass(baseURL: API.AuthenticatedBaseURL)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        dataManager.NewsMethod { (response, error) in
            print(response!)
            
          self.newsArray = (response?["articles"] as AnyObject) as! [AnyObject]
            
            
            DispatchQueue.main.async(execute: {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.tblView .reloadData()
            })
   
        }
        
        
        tblView.register(UINib.init(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: --->  TableView DataSource & Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        
        if let dict: [String: AnyObject]  = newsArray[indexPath.row] as? [String : AnyObject]
        {
            cell.configureCellWithSignUpData(dict,index: indexPath.row)
        }
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let dict : [String: AnyObject] = (newsArray[indexPath.row] as? [String : AnyObject])!
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "DescriptionView") as! DescriptionView
        
        dictValue  = dict["url"] as! String 
        
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }


}


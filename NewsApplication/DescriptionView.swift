//
//  DescriptionView.swift
//  NewsApplication
//
//  Created by Gourav Shukla on 16/08/17.
//  Copyright © 2017 Fishbowl. All rights reserved.
//

import UIKit

  var dictValue : String = ""

class DescriptionView: UIViewController {
    
   
    
  @IBOutlet var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.isOpaque = false;
        webview.backgroundColor = UIColor.clear
        
        if let url = URL (string: dictValue){
            let requestObj = URLRequest(url: url)
            _ = webview.loadRequest(requestObj)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
       _ = self.navigationController?.popViewController(animated: true)
    }

 

}

//
//  ViewController.swift
//  Task
//
//  Created by Mina on 9/7/16.
//  Copyright © 2016 myOrganization. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let URL = "http://grapesnberries.getsandbox.com/products?count=10&from=55"
        Alamofire.request(.GET, URL).responseArray { (response: Response <[ProductItem], NSError>) in
            
            let products = response.result.value
            
                for item in products! {
                    print(item.id)
                    print(item.image!.imageURL)
                }
           
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


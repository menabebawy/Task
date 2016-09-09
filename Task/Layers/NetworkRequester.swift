//
//  NetworkRequester.swift
//  Task
//
//  Created by Mina on 9/8/16.
//  Copyright © 2016 myOrganization. All rights reserved.
//

import UIKit
import Alamofire

class NetworkRequester: NSObject {
    
    //request products by products count and listen from 
    class func requestProductsByProductCount (productsCount: Int, listenfrom: Int, withCompletion:((productsArray: [ProductItem]) -> Void)) -> Void {
    
        let URL = Constants.productsAPIURL + Constants.productsCount + String(productsCount) + Constants.productsListenFrom + String(listenfrom)
        print(URL)
        //request URL
        Alamofire.request(.GET, URL).responseArray { (response: Response <[ProductItem], NSError>) in
            withCompletion(productsArray: response.result.value!)
        }
    }
}

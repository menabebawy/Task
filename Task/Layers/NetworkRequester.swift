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
    class func requestProductsByProductCount (productsCount: Int, listenfrom: Int) -> [ProductItem] {
        var productItems: [ProductItem] = []
        let URL = Constants.productsAPIURL + Constants.productsCount + String(productsCount) + Constants.productsListenFrom + String(listenfrom)
        print(URL)
        //request URL
        Alamofire.request(.GET, URL).responseArray { (response: Response <[ProductItem], NSError>) in
            productItems = response.result.value!
        }
        return productItems
    }
}

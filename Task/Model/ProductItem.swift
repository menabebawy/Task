//
//  ProductItem.swift
//  Task
//
//  Created by Mina on 9/7/16.
//  Copyright © 2016 myOrganization. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper
import Alamofire


class ProductItem  : Mappable{
    
    //product id
    var id:Int?
    //product description
    var productDescription:String?
    //product price
    var price:Int?
    //product image
    var image:ProductImage?
    
    //init
    required init?(_ map: Map){
    }
    
    //mapping JSON dictionary's key to local object
    func mapping(map: Map) {
        id <- map["id"]
        productDescription <- map["productDescription"]
        price<-map["price"]
        image <- map["image"]
    }
    
    func heightForComment(font: UIFont, width: CGFloat) -> CGFloat {
        let rect = NSString(string: productDescription!).boundingRectWithSize(CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return ceil(rect.height)
    }

}

    
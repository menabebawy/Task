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
import AlamofireObjectMapper

class ProductItem  : Mappable{

    var id:Int?
    var productDescription:String?
    var price:Int?
    var image:ProductImage?
    
    required init?(_ map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        productDescription <- map["productDescription"]
        price<-map["price"]
        image <- map["image"]
    }
    
    
}
class ProductImage :Mappable{
    required init?(_ map: Map){
        
    }
 
    var imageWidth:Int?
    var imageHeight:Int?
    var imageURL:String?
    func mapping(map: Map) {
        imageWidth <- map["width"]
        imageHeight <- map["height"]
        imageURL<-map["url"]
   }
    


}
    
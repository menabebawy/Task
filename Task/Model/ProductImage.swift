
//
//  ProductImage.swift
//  Task
//
//  Created by Mina on 9/8/16.
//  Copyright © 2016 myOrganization. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductImage :Mappable{
    
    //image width
    var imageWidth:Int?
    //image height
    var imageHeight:Int?
    //image URL
    var imageURL:String?
    
    //init
    required init?(_ map: Map){
    }
    
    //mapping JSON dictionary's key for image's keys to local object
    func mapping(map: Map) {
        imageWidth <- map["width"]
        imageHeight <- map["height"]
        imageURL<-map["url"]
    }
}

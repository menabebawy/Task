//
//  ProductCollectionViewCell.swift
//  Task
//
//  Created by Mina on 9/9/16.
//  Copyright © 2016 myOrganization. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    //image
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet private weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
    
    //price
    @IBOutlet weak var productPriceLabel: UILabel!
    
    //description 
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            imageViewHeightLayoutConstraint.constant = attributes.photoHeight
        }
    }
    
}

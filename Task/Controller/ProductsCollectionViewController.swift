//
//  ProductsCollectionViewController.swift
//  Task
//
//  Created by Mina on 9/8/16.
//  Copyright © 2016 myOrganization. All rights reserved.
//

import UIKit
import Kingfisher  //webImage library

private let reuseIdentifier = "Cell"

class ProductsCollectionViewController: UICollectionViewController {
    
    //Products array
    var productsArray: [ProductItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        // Set the PinterestLayout delegate
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        //load products
        self.loadProducts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.productsArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: ProductCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ProductCollectionViewCell
    
        // Configure the cell
        let productObj: ProductItem = self.productsArray[indexPath.row]
        cell.productDescriptionLabel?.text = productObj.productDescription
        cell.productPriceLabel?.text = String(format:"%d", productObj.price!) as String
        cell.productImage.kf_setImageWithURL(NSURL(string:productObj.image!.imageURL!)!, placeholderImage:Image(named:"PlaceholderImage"))
        
        // Configure layer 
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 4.0
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    //load products
    func loadProducts () {
         NetworkRequester.requestProductsByProductCount(10, listenfrom: 50) { (productsArray) in
            if(productsArray.count>1){
                self.productsArray = productsArray
                self.collectionView!.reloadData()
            }else{
                //error messgae -> can't load products from API
            }
        }
    }

}


extension ProductsCollectionViewController : PinterestLayoutDelegate {
    // Return the photo height
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        let product = productsArray[indexPath.item]
        return CGFloat(product.image!.imageHeight!)
    }
    
    // Return the annotation size based on the text
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat {
        let annotationPadding = CGFloat(4)
        let annotationHeaderHeight = CGFloat(17)
        let product = productsArray[indexPath.item]
        let font = UIFont(name: "AvenirNext-Regular", size: 10)!
        let commentHeight = product.heightForComment(font, width: width)
        let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
        return height
    }
}

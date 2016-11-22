//
//  HomeVC.swift
//  WatchShop
//
//  Created by QUYNV on 11/21/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var items : [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "WORLD OF WATCH"
        
        var myData : NSDictionary?
        
        if let path = Bundle.main.path(forResource: "items", ofType: "plist") {
            myData = NSDictionary(contentsOfFile: path)
        }
        
        for data in (myData?.allValues) as! [NSDictionary] {
            items.append(Item(name: data["name"] as! String, content: data["content"] as! String, nameImages: data["images"] as! NSArray as! [String]))
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ItemCell
        
        cell.addObjectToView()
        cell.imgView.image = UIImage(named: items[indexPath.item].nameImages[0] + ".jpg")
        cell.nameLabel.text = items[indexPath.item].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detail.item = items[indexPath.item]
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}

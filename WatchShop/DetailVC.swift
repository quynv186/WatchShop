//
//  DetailVC.swift
//  WatchShop
//
//  Created by QUYNV on 11/22/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txt_Content: UITextView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var item : Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_Name.text = item.name
        
        txt_Content.text = item.content
        imgView.image = UIImage(named: item.nameImages[0] + ".jpg")
        imgView.isUserInteractionEnabled = true
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapImg))
        imgView.addGestureRecognizer(tapGes)
    }
    
    func tapImg() {
        pushView(index: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.nameImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ItemCell
        
        cell.kCellWidth = 100
        cell.addObjectToView()
        cell.imgView.contentMode = .scaleAspectFit
        cell.imgView.image = UIImage(named: item.nameImages[indexPath.item] + ".jpg")
        
        return cell
    }
    
    func pushView(index : Int) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ScrollView") as! ScrollView
        view.currentPage = index
        view.pageImages = item.nameImages
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushView(index: indexPath.item)
    }

}

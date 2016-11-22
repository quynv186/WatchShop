//
//  ItemCell.swift
//  WatchShop
//
//  Created by QUYNV on 11/21/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    var nameLabel : UILabel!
    var imgView : UIImageView!
    var kCellWidth : CGFloat = 130
    var kLabelHeight : CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addObjectToView() {
        if (imgView == nil) {
            imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: kCellWidth, height: kCellWidth))
            imgView.layer.borderColor = tintColor.cgColor
            imgView.contentMode = .scaleAspectFit
            
            contentView.addSubview(imgView)
        }
        
        if (nameLabel == nil) {
            nameLabel = UILabel(frame: CGRect(x: 0, y: kCellWidth, width: kCellWidth, height: kLabelHeight))
            nameLabel.textAlignment = .center
            nameLabel.textColor = UIColor(white: 0.9, alpha: 1.0)
            nameLabel.highlightedTextColor = tintColor
            nameLabel.font = UIFont.systemFont(ofSize: 15)
            nameLabel.numberOfLines = 2
            
            contentView.addSubview(nameLabel)
        }
        
    }
    
    override var isSelected: Bool {
        didSet {
            imgView.layer.borderWidth = isSelected ? 2 : 0
        }
    }
}

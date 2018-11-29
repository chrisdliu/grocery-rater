//
//  CategoryLayout.swift
//  Grocery Rater
//
//  Created by Chris Liu on 11/28/18.
//  Copyright © 2018 cathris. All rights reserved.
//

import UIKit

class CategoryLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 20
        scrollDirection = .vertical
    }
    
    override var itemSize: CGSize {
        set {}
        get {
            let numberOfColumns: CGFloat = 2
            let itemWidth = (self.collectionView!.frame.width - 20 - (numberOfColumns - 1)) / numberOfColumns
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
}

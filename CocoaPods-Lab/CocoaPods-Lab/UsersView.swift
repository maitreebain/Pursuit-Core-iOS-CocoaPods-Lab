//
//  UsersView.swift
//  CocoaPods-Lab
//
//  Created by Maitree Bain on 2/28/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit
import SnapKit

class UsersView: UIView {
    
    public lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .red
        cv.layer.cornerRadius = 4
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUpCollectionViewConstraints()
    }
    
    private func setUpCollectionViewConstraints() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
    }
    

}

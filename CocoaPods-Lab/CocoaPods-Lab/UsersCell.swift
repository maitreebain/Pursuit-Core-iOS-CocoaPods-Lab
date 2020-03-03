//
//  UsersCell.swift
//  CocoaPods-Lab
//
//  Created by Maitree Bain on 3/2/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class UsersCell: UICollectionViewCell {
    
    public lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.fill")
        return image
    }()
    
    public lazy var userName: UILabel = {
       let label = UILabel()
        label.text = "Name label"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
    }
    
    private func setUpUserImageConstraints() {
        
    }
    
    private func setUpNameLabelConstraints() {
        
    }
    
    public func configureCell(for user: User) {
        
    }
}

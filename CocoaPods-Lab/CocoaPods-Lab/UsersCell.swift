//
//  UsersCell.swift
//  CocoaPods-Lab
//
//  Created by Maitree Bain on 3/2/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit
import ImageKit

class UsersCell: UICollectionViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    public func configureCell(for user: User) {
        personImage.getImage(with: user.picture.medium) { [weak self] (result) in
            
            switch result {
            case .failure(let appError):
                print("no image found: \(appError)")
            case .success(let image):
                self?.personImage.image = image
            }
        }
        
        nameLabel.text = "\(user.name.first) \(user.name.last)"
    }
    
}

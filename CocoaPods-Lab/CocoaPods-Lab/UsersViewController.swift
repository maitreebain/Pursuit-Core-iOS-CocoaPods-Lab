//
//  ViewController.swift
//  CocoaPods-Lab
//
//  Created by Maitree Bain on 2/28/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    let userView = UsersView()
    
    override func loadView() {
        view = userView
    }
    
    var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.userView.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userView.collectionView.dataSource = self
        userView.collectionView.delegate = self
        userView.collectionView.register(UINib(nibName: "UsersCell", bundle: nil), forCellWithReuseIdentifier: "userCell")
    }


}

extension UsersViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UsersCell else {
            fatalError("could not downcast to UsersCell")
        }
        
        return cell
    }
    
    
}

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
        loadData()
    }
    
    private func loadData(){
        UsersAPIClient.getUsers { (result) in
            
            switch result{
            case .failure(let error):
                print("no users found: \(error)")
            case .success(let users):
                self.users = users
            }
        }
    }


}

extension UsersViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let maxWidth = UIScreen.main.bounds.size.width
        let numberOfItems: CGFloat = 2
        let totalSpace: CGFloat = numberOfItems * itemSpacing
        let itemWidth: CGFloat = (maxWidth - totalSpace) / numberOfItems
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 8, bottom: 20, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UsersCell else {
            fatalError("could not downcast to UsersCell")
        }
        let user = users[indexPath.row]
        cell.configureCell(for: user)
        cell.backgroundColor = .red
        return cell
    }
    
}

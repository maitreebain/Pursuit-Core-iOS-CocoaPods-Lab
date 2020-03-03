//
//  DetailViewController.swift
//  CocoaPods-Lab
//
//  Created by Maitree Bain on 2/28/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }

    private let user: User
    
    init(_ user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        view.backgroundColor = .systemGroupedBackground
    }
    
    private func updateUI() {
        let address = "\(user.location.street.name) \(user.location.street.number) \(user.location.city) \(user.location.state) \(user.location.postcode)"
        detailView.addressLabel.text = "\(address)"
        detailView.phoneLabel.text = "Phone: \(user.phone)"
        detailView.dobLabel.text = "Date of birth: \(user.dob.date)"
        detailView.imageView.getImage(with: user.picture.large) { [weak self] (result) in
            
            switch result {
            case .failure(let appError):
                print("no image found: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailView.imageView.image = image
                }
            }
        }
    }
    
}

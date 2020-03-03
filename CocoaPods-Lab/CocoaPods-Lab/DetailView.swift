//
//  DetailView.swift
//  CocoaPods-Lab
//
//  Created by Maitree Bain on 2/28/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit
import SnapKit

class DetailView: UIView {
    
    /*
     showing their full address, phone number, and date of birth
     */
    
    public lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo.fill")
        return iv
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "addy"
        return label
    }()
    
    public lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "phone"
        return label
    }()
    
    public lazy var dobLabel: UILabel = {
        let label = UILabel()
        label.text = "dob"
        return label
    }()
    
    public lazy var labelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [addressLabel, phoneLabel, dobLabel])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        setUpImageViewConstraint()
        setUpLabelStackConstraints()
    }

    private func setUpImageViewConstraint() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(8)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
    
    private func setUpLabelStackConstraints() {
        addSubview(labelStack)
        labelStack.snp.makeConstraints { (make) in
            make.bottom.trailing.leading.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
    }

    
}

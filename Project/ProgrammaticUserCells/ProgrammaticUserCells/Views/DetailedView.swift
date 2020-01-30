//
//  DetailedView.swift
//  ProgrammaticUserCells
//
//  Created by Cameron Rivera on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailedView: UIView {

    public lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        setUpImageViewConstraints()
        setUpNameLabelConstraints()
        setUpDobLabelConstraints()
        setUpEmailLabelConstraints()
        setUpAddressLabelConstraints()
    }
    
    private func setUpImageViewConstraints(){
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)])
    }
    
    private func setUpNameLabelConstraints(){
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20), nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }
    
    private func setUpDobLabelConstraints(){
        addSubview(ageLabel)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20), ageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),ageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }
    
    private func setUpEmailLabelConstraints(){
        addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([emailLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20), emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }
    
    private func setUpAddressLabelConstraints(){
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([addressLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20), addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }

}

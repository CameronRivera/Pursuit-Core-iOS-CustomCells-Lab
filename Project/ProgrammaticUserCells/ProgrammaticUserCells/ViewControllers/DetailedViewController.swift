//
//  DetailedViewController.swift
//  ProgrammaticUserCells
//
//  Created by Cameron Rivera on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

// More information about a selected user
class DetailedViewController: UIViewController {

    // MARK: Properties
    var detailedView = DetailedView()
    var currentPerson: User?
    
    override func loadView(){
        view = detailedView
    }
    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: Helper Methods
    private func setUp(){
        view.backgroundColor = .systemGray4
        navigationItem.title = "Detailed Information"
        guard let user = currentPerson else {
            fatalError("Failed to pass user during segue")
        }
        
        detailedView.addressLabel.text = "\(user.location.street) \(user.location.city), \(user.location.state), \(user.location.postcode)"
        detailedView.nameLabel.text = "Name: \(user.name.first) \(user.name.last)"
        detailedView.ageLabel.text = "Age: \(user.dob.age)"
        detailedView.emailLabel.text = "Email Address: \(user.email)"
        detailedView.imageView.getImage(using: user.picture.large) { [weak self] result in
            switch result{
            case .failure:
                DispatchQueue.main.async{
                    self?.detailedView.imageView.image = UIImage(systemName: "person")
                }
            case .success(let image):
                DispatchQueue.main.async{
                    self?.detailedView.imageView.image = image
                }
            }
        }
        
    }

}

//
//  RandomPersonCell.swift
//  ProgrammaticUserCells
//
//  Created by Cameron Rivera on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class RandomPersonCell: UICollectionViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var imageURL = ""
    
    func setUp(_ user: User){
        imageURL = user.picture.large
        nameLabel.text = "\(user.name.first) \(user.name.last)"
        userImageView.getImage(using: user.picture.large) { [weak self] result in
            switch result{
            case .failure:
                DispatchQueue.main.async{
                    self?.userImageView.image = UIImage(systemName: "person")
                }
            case .success(let image):
                if self?.imageURL == user.picture.large{
                    DispatchQueue.main.async{
                        self?.userImageView.image = image
                    }
                }
            }
        }
    }
}

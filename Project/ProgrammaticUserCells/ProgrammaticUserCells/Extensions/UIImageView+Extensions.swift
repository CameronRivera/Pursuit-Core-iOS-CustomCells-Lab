//
//  UIImageView+Extensions.swift
//  ProgrammaticUserCells
//
//  Created by Cameron Rivera on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

extension UIImageView{
    func getImage(using urlString: String, completion: @escaping
    (Result<UIImage, AppError>) -> ()) {
        guard let url = URL(string: urlString) else{
            completion(.failure(.badURL))
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: HTTPMethod.get) { result in
            switch result{
            case .failure(let appError):
                completion(.failure(.other(rawError: appError)))
            case .success(let data):
                if let image = UIImage(data: data){
                    completion(.success(image))
                }
            }
        }
    }
}

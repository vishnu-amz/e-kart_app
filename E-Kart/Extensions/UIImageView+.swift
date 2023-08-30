//
//  UIImageView+.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(withURL url: URL?, placeholder: UIImage? = nil, completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
        self.kf.setImage(with: url, placeholder: placeholder, completionHandler: completionHandler)
    }
}

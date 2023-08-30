//
//  BannersCollectionViewCell.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import UIKit

class BannersCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Objects
    var bannerImage: String? {
        didSet {
            if let url = URL(string: bannerImage ?? "") {
                imgBanner.setImage(withURL: url, placeholder: UIImage(named: "Logo.png"))
                imgBanner.cornerRadius = 4
            }
        }
    }
    
    @IBOutlet weak var imgBanner: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}

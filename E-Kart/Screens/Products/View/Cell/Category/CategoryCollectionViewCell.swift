//
//  CategoryCollectionViewCell.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - Objects
    var category: Value? {
        didSet {
            categoryListing()
        }
    }
    
    var colorGroup: UIColor? {
        didSet {
            viewColorBackground.backgroundColor = colorGroup
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var viewColorBackground: UIView!
    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var lblCategoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewColorBackground.cornerRadius = viewColorBackground.frame.height / 2
    }
    
    //MARK: - Methods
    func categoryListing() {
        guard let category else {
            return
        }
        if let url = URL(string: category.imageURL ?? "") {
            imgCategory.setImage(withURL: url, placeholder: UIImage(named: "Logo.png"))
        }
        lblCategoryName.text = category.name
    }
}

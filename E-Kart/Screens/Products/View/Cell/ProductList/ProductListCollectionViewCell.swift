//
//  ProductListCollectionViewCell.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import UIKit

protocol CellDelegate: AnyObject {
    func clickOnItemCell(tag: Int)
}

class ProductListCollectionViewCell: UICollectionViewCell {

    //MARK: - Objects
    var product: Value? {
        didSet {
            productItem()
        }
    }
    
    weak var delegate: CellDelegate?
    
    //MARK: - Outlets
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var viewOffer: UIView!
    @IBOutlet weak var lblOffer: UILabel!
    @IBOutlet weak var imgTruck: UIImageView!
    @IBOutlet weak var lblStrikeAmount: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    //MARK: - Methods
    func productItem() {
        if let url = URL(string: product?.image ?? "") {
            imgProduct.setImage(withURL: url, placeholder: UIImage(named: "Logo.png"))
        }
        if product?.isExpress == true {
            imgTruck.image = UIImage(named: "express.png")
            imgTruck.isHidden = false
        } else {
            imgTruck.isHidden = true
        }
        if let offer = product?.offer {
            if offer > 0 {
                lblOffer.text = "\(offer)% OFF "
                viewOffer.isHidden = false
                lblOffer.isHidden = false
            }else {
                viewOffer.isHidden = true
                lblOffer.isHidden = true
            }
        }
        if product?.actualPrice == product?.offerPrice {
            lblOfferPrice.isHidden = true
            lblStrikeAmount.text = product?.actualPrice
        } else {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: product?.actualPrice ?? "0")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
            lblStrikeAmount.attributedText = attributeString
            lblOfferPrice.text = product?.offerPrice
        }
        lblDescription.text = product?.name
    }
    
    //MARK: - IBActions
    @IBAction func btnFavouriteClicked(_ sender: UIButton) {
        delegate?.clickOnItemCell(tag: sender.tag)
    }
}

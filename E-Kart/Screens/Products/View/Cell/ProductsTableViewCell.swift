//
//  ProductsTableViewCell.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    
    //MARK: - Objects
    var type: String?
    var values: [Value]?
    {
        didSet {
            collectionViewProducts.reloadData()
        }
    }
    var colors: [UIColor] = [UIColor.appColor("pink"),
                             UIColor.appColor("yellow"),
                             UIColor.appColor("lightpink"),
                             UIColor.appColor("violet"),
                             UIColor.appColor("orange"),
                             UIColor.appColor("yellow")]
    var selectColor: [UIColor] = []
    
    //MARK: - Outlets
    @IBOutlet weak var collectionViewProducts: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let value = values {
            for colorIndex in 0...value.count {
                selectColor.append(colors[colorIndex])
            }
        }
        collectionViewProducts.dataSource = self
        collectionViewProducts.delegate = self
        collectionViewProducts.register(UINib(nibName: Constant.NibName.category, bundle: nil), forCellWithReuseIdentifier: Constant.Identifiers.categoryCell)
        collectionViewProducts.register(UINib(nibName: Constant.NibName.banner, bundle: nil), forCellWithReuseIdentifier: Constant.Identifiers.bannerCell)
        collectionViewProducts.register(UINib(nibName: Constant.NibName.productList, bundle: nil), forCellWithReuseIdentifier: Constant.Identifiers.productListCell)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}


extension ProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cells = UICollectionViewCell()
        switch type {
        case Constant.Types.category:
            guard let cell = collectionViewProducts.dequeueReusableCell(withReuseIdentifier: Constant.Identifiers.categoryCell, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.category = values?[indexPath.item]
            cell.colorGroup = colors[indexPath.item]
            cells = cell
        case Constant.Types.banner:
            guard let cell = collectionViewProducts.dequeueReusableCell(withReuseIdentifier: Constant.Identifiers.bannerCell, for: indexPath) as? BannersCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.bannerImage = values?[indexPath.item].bannerURL ?? ""
            cells = cell
        case Constant.Types.products:
            guard let cell = collectionViewProducts.dequeueReusableCell(withReuseIdentifier: Constant.Identifiers.productListCell, for: indexPath) as? ProductListCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.product = values?[indexPath.item]
            cell.delegate = self
            cell.btnFavourite.tag = indexPath.row
            cells = cell
        default:
            UICollectionViewCell()
        }
        return cells
    }
}


extension ProductsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        var minimumInteritemSpacing: CGFloat = 0
        switch type {
        case Constant.Types.banner:
            minimumInteritemSpacing = 10.0
        default:
            CGFloat()
        }
        return minimumInteritemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()
        switch type {
        case Constant.Types.category:
            let itemsPerRow:CGFloat = 4
            let hardCodedPadding:CGFloat = 5
            let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
            let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
            size = CGSize(width: itemWidth, height: itemHeight)
        case Constant.Types.banner:
            let itemsPerRow:CGFloat = 1
            let hardCodedPadding:CGFloat = 5
            let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
            let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
            size = CGSize(width: itemWidth, height: itemHeight)
        case Constant.Types.products:
            let itemsPerRow:CGFloat = 2
            let hardCodedPadding:CGFloat = 5
            let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
            let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
            size = CGSize(width: itemWidth, height: itemHeight)
        default:
            CGSize()
        }
        return size
    }
}


extension ProductsTableViewCell: CellDelegate {
    func clickOnItemCell(tag: Int) {
        print("alert")
    }
}

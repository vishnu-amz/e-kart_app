//
//  Constants.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import Foundation

enum Constant {
    enum Api {
        static var baseURL = "https://run.mocky.io/v3/"
        static let productURL = baseURL + "69ad3ec2-f663-453c-868b-513402e515f0"
    }
    
    enum Screens {
        static var home = "Home"
        static var category = "Categories"
        static var offer = "Offers"
        static var cart = "Cart"
        static var account = "Account"
    }
    
    enum PlaceHolders {
        static var search = "Search"
    }
    
    enum Identifiers {
        static var productCell = "productCell"
        static var categoryCell = "CategoryCell"
        static var bannerCell = "BannerCell"
        static var productListCell = "ProductListCell"
    }
    
    enum NibName {
        static var category = "CategoryCollectionViewCell"
        static var banner = "BannersCollectionViewCell"
        static var productList = "ProductListCollectionViewCell"
    }
    
    enum Types {
        static var category = "category"
        static var banner = "banners"
        static var products = "products"
    }
    
}

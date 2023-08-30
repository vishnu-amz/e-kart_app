//
//  Products.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import Foundation

struct Product: Codable {
    let status: Bool?
    let homeData: [HomeDatum]?
}

struct HomeDatum: Codable {
    let type: String?
    let values: [Value]?
}

struct Value: Codable {
    let id: Int?
    let name: String?
    let imageURL, bannerURL: String?
    let image: String?
    let actualPrice, offerPrice: String?
    let offer: Int?
    let isExpress: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case bannerURL = "banner_url"
        case image
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case offer
        case isExpress = "is_express"
    }
}

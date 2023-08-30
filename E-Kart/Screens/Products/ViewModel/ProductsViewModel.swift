//
//  ProductsViewModel.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import Foundation


final class ProductsViewModel {
    
    
    //MARK: - Objects
    var eventHandler: ((_ event: Event) -> Void)?
    var response: Product?
    var type: [String] = []
    var rowHeight = CGFloat()

    
    //MARK: - Methods
    func fetchProducts() {
        self.eventHandler?(.loadingStart)
        ApiManger.shared.fetchData {(result: Result<Product, DataError>) in
            self.eventHandler?(.loadingStops)
            switch result {
            case .success(let response):
                self.response = response
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error)
            }
        }
    }
    
   
    func cellHeight(value: String) -> CGFloat {
        switch value {
        case Constant.Types.category:
            rowHeight = 150.0
        case Constant.Types.banner:
            rowHeight = 200
        case Constant.Types.banner:
            rowHeight = 325
        default:
            rowHeight = 325
        }
        return rowHeight
    }
    
    func seperatingType() {
        if let hmData = response?.homeData {
            for res in hmData {
                if let types = res.type {
                    type.append(types)
                }
            }
        }
    }
    
}


extension ProductsViewModel {
    enum Event {
        case loadingStart
        case loadingStops
        case dataLoaded
        case message(Error?)
    }
}

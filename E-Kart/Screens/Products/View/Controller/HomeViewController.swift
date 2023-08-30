//
//  HomeViewController.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    private var viewModel = ProductsViewModel()
    
    // MARK: - Outlets
    @IBOutlet weak var viewSearchBorder: UIView!
    @IBOutlet weak var txtFieldSearch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        textFieldUI()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    func initViewModel() {
           viewModel.fetchProducts()
           observeEvents()
    }
    
    func observeEvents() {
        viewModel.eventHandler = { [weak self] eventHandler in
            switch eventHandler {
            case .loadingStart:
                print("loadingStart")
            case .loadingStops:
                print("loadingStops")
            case .dataLoaded:
                print("dataLoaded")
                print(self?.viewModel.response ?? Product.self)
            case .message(let err):
                print(err)
            }
        }
    }
    
    func textFieldUI() {
        txtFieldSearch.placeholder = "Search"
        txtFieldSearch.delegate = self
        let searchIconImageView = UIImageView(image: UIImage(named: "search.png"))
        searchIconImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        txtFieldSearch.leftView = searchIconImageView
        txtFieldSearch.leftViewMode = .always
        txtFieldSearch.backgroundColor = .clear
    }
    
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}


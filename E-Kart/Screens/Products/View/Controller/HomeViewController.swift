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
    @IBOutlet weak var tblViewProducts: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        self.hideKeyboardWhenTappedAround()
    }
    
    func configure() {
        textFieldUI()
        navigationItem.title = Constant.Screens.home
        tblViewProducts.dataSource = self
        tblViewProducts.delegate = self
        tblViewProducts.estimatedRowHeight = 80.0
        tblViewProducts.rowHeight = UITableView.automaticDimension
        initViewModel()
    }


    
    // MARK: - Methods
    func initViewModel() {
           viewModel.fetchProducts()
           observeEvents()
    }
    
    func observeEvents() {
        DispatchQueue.main.async {
            LoadingOverlay.shared.showOverlay(view: self.view)
        }
        viewModel.eventHandler = { [weak self] eventHandler in
            switch eventHandler {
            case .loadingStart:
                print("loadingStarts")
            case .loadingStops:
                print("loadingStops")
            case .dataLoaded:
                DispatchQueue.main.async {
                    LoadingOverlay.shared.hideOverlayView()
                    self?.tblViewProducts.reloadData()
                }
            case .message(let err):
                print(err ?? "")
            }
        }
    }
    
    func textFieldUI() {
        txtFieldSearch.placeholder = Constant.PlaceHolders.search
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



extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.response?.homeData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewProducts.dequeueReusableCell(withIdentifier: Constant.Identifiers.productCell) as? ProductsTableViewCell else {
            return UITableViewCell()
        }
        cell.values = viewModel.response?.homeData?[indexPath.row].values
        cell.type = viewModel.response?.homeData?[indexPath.item].type
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let checkType = viewModel.response?.homeData?[indexPath.item].type {
            if indexPath.row == 0 {
               return viewModel.cellHeight(value: checkType)
            } else if indexPath.row == 1 {
                return viewModel.cellHeight(value: checkType)
            } else if indexPath.row == 2 {
                return viewModel.cellHeight(value: checkType)
            } else {
                return viewModel.cellHeight(value: checkType)
            }
        } else {
            return CGFloat()
        }

    }
    
}


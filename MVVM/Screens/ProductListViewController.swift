//
//  ProductListViewController.swift
//  MVVM
//
//  Created by SHAYANUL HAQ SADI on 1/3/24.
//

import UIKit

class ProductListViewController: UIViewController {
    
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
}


extension ProductListViewController {
    
    func configuration() {
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    // DATA Binding event observe
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                // indicator show
                print("loading...")
            case .stopLoading:
                // indicator hide
                print("stopLoading...")
            case .dataLoaded:
                print("dataLoaded...")
                print(self.viewModel.products)
            case .error(let error):
                print(error)
            }
        }
    }
}

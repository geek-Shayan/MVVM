//
//  ProductListViewController.swift
//  MVVM
//
//  Created by SHAYANUL HAQ SADI on 1/3/24.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
}


extension ProductListViewController {
    
    func configuration() {
        productTableView.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductListTableViewCell")
//        productTableView.delegate = self
//        productTableView.dataSource = self
        
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
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }
}



extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell", for: indexPath) as? ProductListTableViewCell else { return UITableViewCell() }
        
        cell.product = viewModel.products[indexPath.row]
        return cell
    }
}


extension ProductListViewController: UITableViewDelegate {
    
}

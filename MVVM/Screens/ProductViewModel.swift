//
//  ProductViewModel.swift
//  MVVM
//
//  Created by SHAYANUL HAQ SADI on 1/3/24.
//

import Foundation

final class ProductViewModel {
    
    var products: [Product] = []
    var eventHandler: ((_ event: Event) -> Void)?  // DATA BINDING Closure
    
    func fetchProducts() {
        eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)
            
            switch response {
            case .success(let products):
//                print(products)
                self.products = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
//                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
}


extension ProductViewModel {
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}





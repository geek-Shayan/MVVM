//
//  Product.swift
//  MVVM
//
//  Created by SHAYANUL HAQ SADI on 1/3/24.
//

import Foundation

struct Product {
   let id: Int
   let title: String
   let price: Float
   let description: String
   let category: String
   let image: String
   let rating: Rate
}

struct Rate {
    let rate: Float
    let count: Int
}

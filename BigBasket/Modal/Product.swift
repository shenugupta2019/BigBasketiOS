//
//  ProductList.swift
//  BigBasket
//
//  Created by Shenu Gupta on 29/10/24.
//

import Foundation

struct Product: Decodable, Identifiable{
//    let id: String
//    let name: String
//    let  price: Int
//    let  description: String
//    let imageUrl: String
//    let  qty: Int
    
    let id: String
    let name: String
    let description: String
    let imageUrl: String
    let price: Double
//    let discountPercentage:Double
//    let price: Double
//    let stock: Int
    
}

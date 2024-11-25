//
//  ProductList.swift
//  BigBasket
//
//  Created by Shenu Gupta on 29/10/24.
//

import Foundation
import SwiftUI

struct Product: Identifiable,Decodable{
//    let id: String
//    let name: String
//    let  price: Int
//    let  description: String
//    let imageUrl: String
//    let  qty: Int
    
    var id: String
    var name: String
    var description: String
    var imageUrl: String
    var price: Double
     var quantity: Int
//    let discountPercentage:Double
//    let price: Double
//    let stock: Int
    
 
}

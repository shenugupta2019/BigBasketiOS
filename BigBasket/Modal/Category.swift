//
//  CategoryList.swift
//  BigBasket
//
//  Created by Shenu Gupta on 29/10/24.
//

import Foundation

struct Category: Decodable,Identifiable {
    let id: String
    let name: String
    let products: [Product]
}



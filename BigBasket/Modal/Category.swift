//
//  CategoryList.swift
//  BigBasket
//
//  Created by Shenu Gupta on 29/10/24.
//

import Foundation

struct Category: Decodable,Identifiable {
    var id: String
    var name: String
    var products: [Product]
}



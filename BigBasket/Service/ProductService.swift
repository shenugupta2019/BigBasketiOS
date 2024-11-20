//
//  ProductService.swift
//  BigBasket
//
//  Created by Shenu Gupta on 29/10/24.
//

import Foundation

class ProductService {
    private let jsonDecoder: JSONDecoder =  {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetchProducts () async throws -> [Product] {
        let url = URL(string: "https://dummyjson.com/products")!
        let (data,_) = try await URLSession.shared.data(from: url)
        let decodedData = try jsonDecoder.decode(ProductListResponse.self, from: data)
        return decodedData.products
    }
}

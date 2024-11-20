//
//  ProductViewModal.swift
//  BigBasket
//
//  Created by Shenu Gupta on 29/10/24.
//

import Foundation

@MainActor
class ProductViewModal:ObservableObject {
    enum State {
        case loading
        case loaded(product:[Product])
        case error(Error)
    }
    
    @Published var state: State = .loading
    
    private let service = ProductService()
    
    func loadJSONFromBundle<T: Decodable>(_ fileName: String, subdirectory: String? = nil) -> T? {
    
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json", subdirectory: subdirectory) else {
            print("Couldn't find \(fileName).json in bundle.")
            return nil
        }
        
        do {
            print("Couldn't find \(url) in url.")
            let data = try Data(contentsOf: url)
            print("data \(data) in url.")
            let decoder = JSONDecoder()
           // state = .loaded(product: products)
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Error loading JSON from bundle: \(error)")
            state = .error(error)
            return nil
        }
    }
    
    func loadProducts() async {
        do{
            state = .loading
            let products = try await service.fetchProducts()
            state = .loaded(product: products)
        } catch {
            state = .error(error)
        }
    }
}

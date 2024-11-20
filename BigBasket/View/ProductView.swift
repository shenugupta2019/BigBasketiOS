////
////  ProductView.swift
////  BigBasket
////
////  Created by Shenu Gupta on 29/10/24.
////
//
//import SwiftUI
//
//struct ProductView: View {
//    
//    @StateObject var viewModel = ProductViewModal()
//    @State private var categories: [Category] = []
//    
//    
//    var body: some View {
//        Group {
//            switch viewModel.state {
//            case .loading:
//                ProgressView()
//                
//            case let .error(error):
//                VStack {
//                    Text(error.localizedDescription)
//                    Button("Retry") {
//                        Task {
//                            await viewModel.loadProducts()
//                        }
//                    }
//                }
//            case .loaded(let products):
//                list(of: products)
//            }
//        }  .onAppear {
//            if let loadedProducts: [Category] = viewModel.loadJSONFromBundle("product", subdirectory: "localJSON") {
//                self.categories = loadedProducts
//                list(of: products)
//            }
//            
//        }
////        .task {
//////            await viewModel.loadProducts()
////            await viewModel.loadJSONFromBundle("products", subdirectory: "localJSON")
////        }
//    }
//    
//    
//    @ViewBuilder
//    func list(of products: [Category]) -> some View {
//        if products.isEmpty == false {
//            List(products) { product in
//                HStack {
//                    AsyncImage(url: URL(string:  "https://assets.dummyjson.com/public/qr-code.png")){ image in
//                        image.resizable().aspectRatio(contentMode: .fit)
//                    } placeholder:{
//                        ProgressView()
//                    }.frame(width: 80)
//                    
//                    VStack(alignment: .leading, spacing: 0.0) {
//                        Text(product.title)
//                        Text(product.description)
//                            .font(.body)
//                            .fontWeight(.bold).padding(.top, 20).padding(.bottom,20)
//                    }
//                    .padding(0.0)
//                    
//                }
//                
//            }
//        }
//    }
//}
//
//#Preview {
//    ProductView()
//}
import SwiftUI
struct ProductView: View {
    let item: Category
    
    var body: some View {
//            NavigationView {
                    // Full-screen background
            List(item.products) { product in
                        HStack {
                            Image(product.imageUrl)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                                .background(Color.clear)
                            
                            VStack(alignment: .leading) {
                                Text(product.name)
                                    .font(.headline)
                                Text(String(format: "$%.2f", product.price))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                   
                            } .background(Color.clear)
                        }
                       // .padding(.vertical, 18)
                       
                
            } .listStyle(PlainListStyle())
            .background(Color.clear)
        }
//                .navigationTitle("Products")
//                .background(Color.yellow)
            //}
        
}



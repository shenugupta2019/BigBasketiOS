//
//  TabView.swift
//  BigBasket
//
//  Created by Shenu Gupta on 05/11/24.
//

import Foundation

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
          //  NewCategoryView()
            CategoryView()
                       .navigationTitle("Settings")  // Title for the navigation bar
               }
       
    }
}

struct SearchView: View {
    @EnvironmentObject var quantityManager: NewQuantityManager

    var body: some View {
           NavigationView {
               List {
                   ForEach(quantityManager.products) { product in
                       HStack {
                           Text(product.name)
                           Spacer()
                           Text("Qty: \(product.quantity)")
                       }
                   }
               }
               .navigationTitle("Products")
           } .onAppear {
               // Ensure the products are synced when the Search tab appears
               quantityManager.syncProducts()
           }
       }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile View")
                .font(.largeTitle)
        }
    }
}


//
//  BigBasketApp.swift
//  BigBasket
//
//  Created by Shenu Gupta on 29/10/24.
//

import SwiftUI

@main
struct BigBasketApp: App {
    @StateObject private var quantityManager = NewQuantityManager()
    @State private var selectedTab = 0
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(1)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(2)
                
            }
            .environmentObject(quantityManager)
//            .onChange(of: selectedTab) {
//                if selectedTab == 1 {
//                    quantityManager.refreshProducts()
//                }
//            }
            //            NavigationView{
            //                CategoryView()
            //            }
        }
    }
    
}

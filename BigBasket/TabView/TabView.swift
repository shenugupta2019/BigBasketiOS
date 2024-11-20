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
            CategoryView()
                       .navigationTitle("Settings")  // Title for the navigation bar
               }
       
    }
}

struct SearchView: View {
    var body: some View {
        VStack {
            Text("Search View")
                .font(.largeTitle)
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


//
//  AppView.swift
//  IDemo
//
//  Created by hosam on 10/28/20.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
                    ContentView()
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Menu")
                        }

                    OrderView()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("Order")
                        }
                }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

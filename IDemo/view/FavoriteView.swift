//
//  FavoriteView.swift
//  IDemo
//
//  Created by hosam on 10/21/20.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var favorite: Order
    
    
    var body: some View {
        NavigationView {
            List{
                ForEach(favorite.items) {item in
                    ItemRow(item: item)
                }
                
            }
            
            .navigationBarTitle("Favorites")
            .listStyle(GroupedListStyle())
        }
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}

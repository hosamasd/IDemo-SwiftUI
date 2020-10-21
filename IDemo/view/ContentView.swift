//
//  ContentView.swift
//  IDemo
//
//  Created by hosam on 10/21/20.
//

import SwiftUI

struct ContentView: View {
    
    let meun = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    
    var body: some View {
        NavigationView {
            List{
                ForEach(meun) {section in
                    Section(header: Text(section.name)
                            , content: {
                                ForEach(section.items) {item in
                                    ItemRow(item: item)
                                }
                            })
                    
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

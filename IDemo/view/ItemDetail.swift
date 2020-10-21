//
//  ItemDetail.swift
//  IDemo
//
//  Created by hosam on 10/21/20.
//

import SwiftUI

struct ItemDetail:View {
    @EnvironmentObject var order:Order
    var item:MenuItem
    @State var isFaavorite:Bool = false
    var favorite = Order()

    var body :some View {
        VStack{
            ZStack(alignment:.bottomTrailing) {
                Image(item.mainImage)
                Text("taken by \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.headline)
                    .foregroundColor(.white)
                    .offset(x:-5,y: -5)
            }
            Text(item.description)
                .padding()
            
            Button("Order this") {
                self.order.add(item: item)
            }.font(.headline)
            Spacer()
        }.navigationBarTitle(Text(item.name),displayMode: .inline)
        .navigationBarItems(trailing:
                                
                               
                                Image(systemName: isFaavorite ? "bookmark.fill" :  "bookmark").onTapGesture(count: 1, perform: {
                                    self.isFaavorite.toggle()
                                    if isFaavorite {
                                        self.order.add(item: item)
                                    }else {
                                        order.remove(item: item)
                                    }
                                })
                                    
                                
//                                Button(action: self.isFaavorite.toggle(), label: {
//            Image(systemName: isFaavorite ? "bookmark.fill" :  "bookmark")
        )
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        ItemDetail( item: MenuItem.example).environmentObject(order)
    }
}

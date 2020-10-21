//
//  OrderView.swift
//  IDemo
//
//  Created by hosam on 10/21/20.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order:Order

    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items) {item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: { indexSet in
                        deleteItems(at: indexSet)
                    })
                }
                
                Section{
                    NavigationLink(
                        destination: CheckoutView(),
                        
                        label: {
                            Text("PLACE ORDER")
                        })
                }.disabled(order.items.isEmpty)
            }
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}

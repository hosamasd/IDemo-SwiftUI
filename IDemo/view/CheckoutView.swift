//
//  CheckoutView.swift
//  IDemo
//
//  Created by hosam on 10/21/20.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let timeTypes = ["Now", "Tonight", "Tomorrow"]

    static let tipAmounts = [10, 15, 20, 25, 0]
    @State private var timeType = 0

    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
   
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation(), label: {
                    Text("Add iDine loyalty card")
                })
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("pickup time")) {
                Picker("Time:", selection: $timeType) {
                    ForEach(0 ..< Self.timeTypes.count) {
                        Text("\(Self.timeTypes[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                        Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                        .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationBarTitle(Text("Payment"))
        .alert(isPresented: $showingPaymentAlert, content: {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") – thank you!"), dismissButton: .default(Text("OK")))
        })
       
        
    }
    
   
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}

//
//  IDemoApp.swift
//  IDemo
//
//  Created by hosam on 10/21/20.
//

import SwiftUI

@main
struct IDemoApp: App {
    
    var order = Order()
    var favorite = Order()

    
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(order).environmentObject(favorite)
        }
    }
}

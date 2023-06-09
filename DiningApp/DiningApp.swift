//
//  DiningAppApp.swift
//  DiningApp
//
//  Created by Mark Holdsworth on 14/03/2023.
//

import SwiftUI

@main
struct DiningApp: App {
    @StateObject var order = Order()
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}

//
//  OrderView.swift
//  DiningApp
//
//  Created by Mark Holdsworth on 15/03/2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { Item in
                        HStack {
                            Text(Item.name)
                            Spacer()
                            Text("£\(Item.price)")
                        }
                        
                    }
                }
                Section {
                    NavigationLink("Place Order") {
                        Text("Check Out")
                    }
                }
            }
            .navigationTitle("Order")
            
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}

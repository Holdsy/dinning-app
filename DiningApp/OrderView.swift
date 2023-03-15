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
                    .onDelete(perform: deleteItems)
                }
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}

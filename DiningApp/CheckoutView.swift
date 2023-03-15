//
//  CheckoutView.swift
//  DiningApp
//
//  Created by Mark Holdsworth on 15/03/2023.
//

import SwiftUI

struct CheckoutView: View {
   
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentType = "cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [0,10,15,20,25]
    @State private var tipAmount = 10
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipvalue = total / 100 * Double(tipAmount)
        return (total + tipvalue).formatted(.currency(code: "GBP"))
    }
    
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay ?", selection: $paymentType) {
                    ForEach(paymentTypes, id:\.self) {
                        Text($0)
                       
                        }
                    }
              Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
               
                if addLoyaltyDetails {
                 TextField("Enter your iDine ID", text: $loyaltyNumber)
              }
            }
            
            Section("Add a tip") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    // place the order
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}

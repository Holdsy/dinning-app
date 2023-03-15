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

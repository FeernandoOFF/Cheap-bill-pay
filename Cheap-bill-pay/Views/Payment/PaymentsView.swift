//
//  PaymentsView.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 06/04/2023.
//

import SwiftUI

struct PaymentsView: View {
    @StateObject var viewModel = PaymentsViewModel()
    @State var currentView = 0
    
    var body: some View {
        NavigationView{
            VStack {
                //            Picker
                Picker("What is your favorite color?", selection: $currentView) {
                    Text("Payments").tag(0)
                    Text("Bills").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                //            List
                List(viewModel.payments){ payment in
                    if(payment.type == "Payment" && currentView == 0){
                        NavigationLink(destination: PaymentsReceipt()) {
                            Text(payment.title)
                        }
                    }else if (payment.type == "Bill" && currentView == 1) {
                        NavigationLink(destination: PaymentsReceipt()) {
                            Text(payment.title)
                        }
                    }
                    
                }.listStyle(.plain)
            }
            
            
            //        TODO: Make view modifier
            .modifier(NavigationBarViewModifier())
        }
    }
}

struct PaymentsView_Previews: PreviewProvider {
    static var previews: some View {
            PaymentsView()
    }
}

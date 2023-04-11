//
//  HomeViewModel.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 06/04/2023.
//

import Foundation

final class PaymentsViewModel: ObservableObject {
    
    
    
    @Published var payments: [Payment] = [
        Payment(id: "1", title: "Payment test 1", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type: "Payment"),
        Payment(id: "2", title: "Bill test 1", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type:"Bill"),
        Payment(id: "3", title: "Bill test 2", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type:"Bill"),
        Payment(id: "4", title: "Payment test 2", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type: "Payment"),
        Payment(id: "5", title: "Payment test 5", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type: "Payment"),
        Payment(id: "6", title: "Payment test 6", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type: "Payment"),
        Payment(id: "7", title: "Bill test 3", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type:"Bill"),
        Payment(id: "8", title: "Bill test 4", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type:"Bill"),
    ]

    
    func onAppear(){
    }
}



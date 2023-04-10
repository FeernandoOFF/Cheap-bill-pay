//
//  HomeViewModel.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 06/04/2023.
//

import Foundation

final class PaymentsViewModel: ObservableObject {
    
    
    
    @Published var payments: [Payment] = [
        Payment(id: "1", title: "20 Mar 2023", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type: "Payment"),
        Payment(id: "2", title: "Test", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type:"Bill"),
        Payment(id: "3", title: "Test 2", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type:"Bill"),
        Payment(id: "4", title: "Payment", description: "One off payment", icon:"doc.plaintext.fill" , rightLabel: "€130.88",type: "Payment"),
    ]

    
    func onAppear(){
    }
}



//
//  PaymentModel.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 07/04/2023.
//

import Foundation

struct Payment: Identifiable {
    let id: String
    let title: String
    let description: String
    let icon: String?
    let rightLabel: String?
    let type: String
    
}


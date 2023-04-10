//
//  NextPayModel.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 06/04/2023.
//

import Foundation

struct NextPayModel: Decodable, Identifiable,Hashable {
    let id: String
    let title: String
    let date: String
    let icon: String? 
    let rightLabel: String?
}

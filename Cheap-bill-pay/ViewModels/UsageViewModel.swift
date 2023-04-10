//
//  UsageViewModel.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 10/04/2023.
//

import Foundation

final class UsageViewModel: ObservableObject {
    
    @Published var chartData: [MountPrice] = [
        MountPrice(mount: "Jan", value: 35, type: "A"),
        MountPrice(mount: "Feb", value: 14, type: "A"),
        MountPrice(mount: "Mar", value: 7, type: "A"),
        MountPrice(mount: "Apr", value: 5, type: "A"),
        MountPrice(mount: "May", value: 14, type: "A"),
        MountPrice(mount: "Jun", value: 7, type: "A"),
        MountPrice(mount: "Jul", value: 7, type: "A"),
        MountPrice(mount: "Sep", value: 17, type: "A"),
        MountPrice(mount: "Oct", value: 26, type: "A"),
        MountPrice(mount: "Nov", value: 24, type: "A"),
        MountPrice(mount: "Dec", value: 37, type: "A"),
    ]
}

struct MountPrice: Identifiable {
    var id = UUID()
    var mount: String
    var value: Double
    var type: String
    var animate = false
}

//
//  UsageTrend.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 10/04/2023.
//

import SwiftUI
import Charts

struct UsageTrend: View {
    @ObservedObject var viewModel = UsageViewModel()
    
    var body: some View {
        NavigationView {
            Chart(viewModel.chartData) { data in
                LineMark(x: .value("Month", data.mount), y: .value("Value", data.value))
            }
            .frame(maxHeight: 300)
            
        .navigationTitle("Usage Trend")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UsageTrend_Previews: PreviewProvider {
    static var previews: some View {
        UsageTrend()
    }
}

//
//  UsageChartView.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 10/04/2023.
//

import SwiftUI
import Charts



struct UsageChartView: View {
        
    let data: [MountPrice]
    
    var body: some View {
        
            List {
                Chart {
                    ForEach(data) {
                        AreaMark(
                            x: .value("Mount", $0.mount),
                            y: .value("Value", $0.value)
                        )
                        .foregroundStyle(by: .value("Type", "Series \($0.type)"))
                    }
                }
                .frame(height: 200)
            }
    }
}

struct UsageChartView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        UsageChartView(data:[
        MountPrice(mount: "jan/22", value: 5, type: "A"),
        MountPrice(mount: "feb/22", value: 4, type: "A"),
        MountPrice(mount: "mar/22", value: 7, type: "A"),
        MountPrice(mount: "apr/22", value: 15, type: "A"),
        MountPrice(mount: "may/22", value: 14, type: "A"),
        ])
            .previewLayout(.sizeThatFits)
            .frame(width: .infinity,height: 300)
    }
}

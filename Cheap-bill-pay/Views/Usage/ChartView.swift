//
//  ChartView.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 10/04/2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    @State var data: [MountPrice]
    
    @State var animate = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Chart(data) { data in
                BarMark(
                    x: .value("Value", data.mount) ,
                    y: .value("Profit", data.animate ? data.value : 0))
            }
            .frame(height: 250)
            .onAppear {
                for (index,_) in data.enumerated() {
                    withAnimation(.interactiveSpring().delay(Double(index) * 0.05)) {
                        self.data[index].animate = true
                        
                    }
                }
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(data:[
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
        ])
    }
}

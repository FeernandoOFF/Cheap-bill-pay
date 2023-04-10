//
//  UsageView.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 06/04/2023.
//

import SwiftUI
import Charts

struct UsageView: View {
    @ObservedObject var viewModel = UsageViewModel()
    @State var isModalOpen = false
    @State var addChartPicer = 0
    
    @State var charts = 0
    
    var body: some View {

        NavigationView {
            ScrollView {
                if(charts == 0){
                    Text("Add your first chart by pressing the + icon")
                }else {
                // Show charts
                    ForEach(1...charts,id: \.self){ chart in
                        FullChartView(data: viewModel.chartData)
                    }
                }
            }
            // NavView Properties
            .navigationTitle("Usage")
            .navigationBarItems(trailing: HStack{
                Image(systemName: "plus")
                    .foregroundColor(Color("Secondary"))
                    .onTapGesture {
                        isModalOpen.toggle()
                    }
                    .sheet(isPresented: $isModalOpen) {
                        Text("Select from your active services: ")
                        Divider()
                        Picker("Test",selection: $addChartPicer){
                            Text("Electricity").tag(0)
                            Text("Gas").tag(1)
                            Text("Internet").tag(2)
                    }
                        .pickerStyle(.wheel)
                        Button {
                            isModalOpen.toggle()
                            charts += 1
                        } label: {
                            Text("Add")
                        }

                }
            })
        }
    }
}

struct UsageView_Previews: PreviewProvider {
    static var previews: some View {
        UsageView()
    }
}



struct FullChartView: View {
    let data: [MountPrice]
    
    @State var visible = 0
    
    var chartPlaceHolder:String {
        switch(visible){
        case 0:
            return "Weekly Usage of "
        case 1:
            return "Montly Usage of "
        case 2:
            return "Yearly Usage of "
        default:
            return "Chart view"
        }
        
    }
    
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            HStack(spacing: 20) {
                Text("\(chartPlaceHolder) Gas")
                    .font(.title3)
                
                Spacer()
                
                Picker("Test",selection: $visible){
                    Text("7 days").tag(0)
                    Text("Month").tag(1)
                    Text("Year").tag(2)
                }.pickerStyle(.segmented)
            }
            Divider()
            ChartView(data: data)
        }.padding(.all)
    }
}

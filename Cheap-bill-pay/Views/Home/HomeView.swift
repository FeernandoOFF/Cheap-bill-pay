//
//  HomeView.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 06/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    //Bindings
    @State private var showUsageTrend = false
    @State private var currentBillPeriod =  0.25
    
    var body: some View {
        
    NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    //            Primary
                    VStack(alignment:.leading) {
                        HStack(spacing: 10) {
                            Text(viewModel.headerText)
                                .fontWeight(.bold)
                                .frame(maxWidth: 250)
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Tertiary"))
                                .frame(width: 50, height: 40.0)
                                .overlay {
                                    Image(systemName: "chart.xyaxis.line")
                                        .foregroundColor(Color.white)
                                }
                                .onTapGesture {
                                    showUsageTrend.toggle()
                                }
                                .sheet(isPresented: $showUsageTrend){
                                    UsageTrend()
                                }
                        }
                        .frame(maxHeight: 130.0)
//                        Balance
                        HStack(alignment: .firstTextBaseline) {
                            Text("€\(viewModel.integerPart)")
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                                .font(.system(size: 70))
                            Text(".\(viewModel.decimalPart)")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 50))
                        }
                    }.frame(maxHeight: 220)
//             Secondary
                    VStack(alignment:.leading,spacing: 20) {
                        // Breakdown
                        BreakdownView(breakdown: viewModel.breakdownList)
                        //Progress
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).fill(Color("Primary"))
                            VStack(alignment: .leading) {
                                ProgressView(value: viewModel.currentBillPeriod) {
                                    HStack {
                                        Text("Current bill period")
                                        Spacer()
                                        Text("\(viewModel.daysLeft) Days left")
                                            .fontWeight(.semibold)
                                    }
                                }
                                Text(viewModel.secondaryDateRange)
                            }.padding(.all)
                        }
                    }
                    
//            More
                    Text("MORE")
                        .fontWeight(.bold)
                    // Next payment list
                    if(viewModel.nextPayments.isEmpty ){
                            HStack(alignment: .center){
                                Spacer()
                                if(viewModel.loading){
                                    ProgressView()
                                }else{
                                    Text("Seems that there's nothing here..")
                                }
                                Spacer()
                        }
                    }
                    ForEach(viewModel.nextPayments, id: \.self) {
                        CardView(payment: $0)
                            .padding(.vertical, 10.0)
                            .listRowInsets(.init())
                            .listRowSeparator(.hidden)
                    }
                    
                    Spacer()
                }
                .padding(.all)
            }
         
//        View configuration
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(NavigationBarViewModifier())
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
    }
}

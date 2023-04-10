//
//  HomeViewModel.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 06/04/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    let networkManager = NetworkManager()
    
    @Published var breakdownList = [
        Breakdown(leftText: "Original Estimate", rightText: "€150.70"),
        Breakdown(leftText: "Current estimate for this billing period", rightText: "€140.20"),
    ]
    @Published var nextPayments: [NextPayModel] = []
    
    
    @Published var headerText = "🥳 Hi Orla, good news! So far, you’re beating your bill by"
    @Published var integerPart = 0
    @Published var decimalPart = 0
//    Secondary section
    @Published var currentBillPeriod = 0.45
    @Published var daysLeft = 2
    @Published var loading = true
    @Published var secondaryDateRange = "27 Feb - 26 Mar"
    
    var billNumber = 10.80
    
    init(){
//        Split billNumber in two variables
        self.integerPart = Int(billNumber)
        self.decimalPart = Int((billNumber.truncatingRemainder(dividingBy: 1)) * 100)

    }
    
    func onAppear(){
        //... fetch nextPayments
        networkManager.fetchNextPayments { nextPayments in
            if let safePayments = nextPayments {
                self.nextPayments = safePayments
            }else{
                //Handle Epmty request... (UI Working, trigger an analytics event)
            }
            self.loading = false
        }
    }
}

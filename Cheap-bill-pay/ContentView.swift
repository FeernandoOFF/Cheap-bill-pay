//
//  ContentView.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 06/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView{
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                UsageView()
                    .tabItem {
                        Label("Usage", systemImage: "chart.bar.doc.horizontal")
                    }
                PaymentsView()
                    .tabItem {
                        Label("Payments", systemImage: "wallet.pass")
                    }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  PaymentsReceipt.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 07/04/2023.
//

import SwiftUI

struct PaymentsReceipt: View {
    @State var data:Data?
    @State var loading = true
    
    let url = URL(string: "https://www.localenterprise.ie/Wicklow/Financial-Supports/Trading-Online-Vouchers/The-Website-Development-Guide.pdf")
    
    var body: some View {
       VStack {
            if let safePDF = data {
                PDFKitRepresentedView(safePDF)
            }
           else if (loading == false){
                Text("There's an error displaying this PDF, please try later ")
           }else{
               ProgressView()
           }
        }
       .onAppear {
           if let safeURL = self.url {
               URLSession.shared.dataTask(with: safeURL) { data, response, error in
                   if let error = error {
                       print("Error: \(error.localizedDescription)")
                       loading = false
                       return
                   }
                   
                   if let data = data {
                       DispatchQueue.main.async {
                           self.data = data
                       }
                   }
               }.resume()
           }
       }
    }
}

struct PaymentsReceipt_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsReceipt()
    }
}

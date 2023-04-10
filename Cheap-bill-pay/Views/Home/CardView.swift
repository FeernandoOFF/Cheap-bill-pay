//
//  CardView.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 06/04/2023.
//

import SwiftUI

struct CardView: View {
    let payment: NextPayModel
    
    var body: some View {
        NavigationLink(destination: PaymentsReceipt()){
        ZStack {
        RoundedRectangle(cornerRadius: 10.0)
                .fill(Color("Primary"))
            
            VStack(alignment: .leading){
            HStack{
                Circle()
                    .fill(Color(red: 0.9921568627450981, green: 0.6901960784313725, blue: 0.6313725490196078))
                    .overlay {
                        Image(systemName: payment.icon ??  "trophy" )
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(Color("Secondary"))
                            .padding(.all)
                    }
                VStack(alignment: .leading) {
                    Text(payment.title)
                        .fontWeight(.bold)
                        .font(.system(size:16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("TextColor"))
                    Text(payment.date)
                        .font(.system(size:16))
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("TextColor"))
                }
                Spacer()
                Text(payment.rightLabel ?? "")
                    .fontWeight(.bold)
                    .font(.system(size:16))
                        .foregroundColor(Color("TextColor"))
                Image(systemName: "chevron.right")
                    .foregroundColor(Color("Secondary"))
            }.padding(.all, 16.0)
                Spacer()
                
            }
        }
        .frame(maxHeight: 100)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CardView( payment:NextPayModel(id: "1", title: "trophy" , date: "Test", icon: "chart.xyaxis.line", rightLabel: "€35.00")).previewLayout(.sizeThatFits)
    }
}

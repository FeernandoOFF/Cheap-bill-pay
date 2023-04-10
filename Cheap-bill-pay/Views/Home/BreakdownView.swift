//
//  BreakdownView.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 10/04/2023.
//

import SwiftUI

struct BreakdownView: View {
    let breakdown:[Breakdown]
    
    @State var isOpen = true
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(Color("Primary"))
//            Text
            VStack {
                VStack {
    //                Breakdown
                    DisclosureGroup("Breakdown", isExpanded: $isOpen) {
                        ForEach(breakdown, id: \.self){ _ in
                            //                        Breakdown
                            HStack {
                                Text("Original estimate")
                                    .font(.system(size:12))
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("€150.70")
                                    .font(.system(size:12))
                                    .fontWeight(.bold)
                            }
                        }
                        Divider()
                        
                        HStack {
                                Text("Total")
                                    .font(.system(size:12))
                                    .foregroundColor(Color("TextColor"))
                            Spacer()
                            Text("€350.70")
                                    .font(.system(size:12))
                                .fontWeight(.bold)
                        }
                        
                    }.tint(Color("TextColor"))
                        
                }.padding(.vertical, 12.0)
                    Spacer()
                }.padding(.horizontal)
            }
        }
}

struct BreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownView(breakdown: [
            Breakdown(leftText: "Original Estimate", rightText: "€150.70"),
            Breakdown(leftText: "Current estimate for this billing period", rightText: "€140.20"),
        ]).previewLayout(.sizeThatFits)
    }
}

//
//  NavigationBarViewModifier.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 10/04/2023.
//

import Foundation
import SwiftUI

struct NavigationBarViewModifier: ViewModifier {
    func body(content:Content) -> some View {
        return content
            .navigationBarItems(trailing: HStack{
                Image(systemName: "person.circle")
                    .padding(.all)
                Image(systemName: "text.bubble")
            })
    }
}

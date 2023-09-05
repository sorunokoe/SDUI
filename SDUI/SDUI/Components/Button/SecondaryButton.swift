//
//  SecondaryButton.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 05.09.23.
//

import SwiftUI

struct SecondaryButton: View {
    var title: String
    var action: (() -> Void)
    
    var body: some View {
        Button(title, action: action)
            .padding([.top, .bottom], 20)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color(red: 73/256, green: 151/256, blue: 223/256))
            .font(.system(size: 16, weight: .medium, design: .default))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 73/256, green: 151/256, blue: 223/256), lineWidth: 2))
            .padding([.trailing, .leading], 20)
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(title: "Button") {
            
        }
    }
}

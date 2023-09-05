//
//  PrimaryButton.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 05.09.23.
//

import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    var action: (() -> Void)
    
    var body: some View {
        Button(title, action: action)
            .padding([.top, .bottom], 20)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .medium, design: .default))
            .background(Color(red: 73/256, green: 151/256, blue: 223/256))
            .cornerRadius(20)
            .padding([.trailing, .leading], 20)
    }
    
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Button") {
            
        }
    }
}

//
//  Box.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 05.09.23.
//

import SwiftUI

struct Box: View {
    
    var title: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(red: 73/256, green: 151/256, blue: 223/256))
            Text(text)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.black.opacity(0.8))
        }
        .padding(20)
    }
}

struct Box_Previews: PreviewProvider {
    static var previews: some View {
        Box(title: "Title", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras posuere fermentum enim in malesuada. Nullam in quam ultrices, mattis velit nec, condimentum lectus. Aenean porttitor malesuada lectus vel molestie. Cras malesuada condimentum semper. Nulla nec augue bibendum eros venenatis venenatis. Vivamus at enim erat. Aliquam vel viverra erat, nec dignissim nulla. Nulla facilisi. Nullam malesuada dui ut lectus iaculis imperdiet. Pellentesque ac ante ac diam egestas sodales id nec velit. Donec facilisis nisi sit amet tempor cursus.")
    }
}

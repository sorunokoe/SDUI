//
//  ImageBox.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 05.09.23.
//

import SwiftUI

struct ImageBox: View {
    
    @State var imageView: Image?
    
    var image: String
    var title: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let imageView {
                imageView
                    .renderingMode(.original)
                    .resizable(resizingMode: .stretch)
                    .frame(height: 240)
                    .cornerRadius(20)
            }
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(red: 73/256, green: 151/256, blue: 223/256))
            Text(text)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.black.opacity(0.8))
        }
        .padding(20)
        .onAppear {
            // TODO: Temporary solution
            let data = try? Data(contentsOf: URL(string: image)!)
            if let data, let uiImage = UIImage(data: data) {
                imageView = Image(uiImage: uiImage)
            }
        }
    }
}

struct ImageBox_Previews: PreviewProvider {
    static var previews: some View {
        ImageBox(image: "https://wallpapers.com/images/featured-full/interesting-pictures-0phka103hul2wp72.jpg",
                 title: "Title",
                 text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras posuere fermentum enim in malesuada. Nullam in quam ultrices, mattis velit nec, condimentum lectus. ")
    }
}

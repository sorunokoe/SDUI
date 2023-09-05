//
//  SDComponent.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 05.09.23.
//

import SwiftUI

// UI Representation of Ingredient
enum SDComponent: Identifiable, View {
    
    // Layout
    case layoutPage(components: [SDComponent])
    
    // Figma Components
    case primaryButton(title: String, action: (() -> Void))
    case secondaryButton(title: String, action: (() -> Void))
    case box(title: String, body: String)
    case imageBox(image: String, title: String, body: String)

    var id: UUID {
        UUID()
    }
    
    @ViewBuilder
    var body: some View {
        switch self {
        case let .layoutPage(components):
            SDPageLayout(components: components)
        case let .primaryButton(title, action):
            PrimaryButton(title: title, action: action)
        case let .secondaryButton(title, action):
            SecondaryButton(title: title, action: action)
        case let .box(title, body):
            Box(title: title, text: body)
        case let .imageBox(image, title, body):
            ImageBox(image: image, title: title, text: body)
        }
    }
}

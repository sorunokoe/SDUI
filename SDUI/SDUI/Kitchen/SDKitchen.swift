//
//  SDKitchen.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 05.09.23.
//

import SwiftUI

enum SDReceipt: Decodable {
    
    case home(SDIngredient)
    case none
    
    private enum CodingKeys: String, CodingKey {
        case type, page
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        let page = try container.decode(SDIngredient.self, forKey: .page)
        switch type {
        case "home":
            self = .home(page)
        default:
            self = .none
        }
    }
}

// swiftlint: disable cyclomatic_complexity
enum SDIngredient: Decodable {
    
    case layoutPage([SDIngredient])

    // Components
    case primaryButton(SDButtonModel?)
    case secondaryButton(SDButtonModel?)
    case box(SDBoxModel?)
    case imageBox(SDImageBoxModel?)

    case none
    
    private enum CodingKeys: String, CodingKey {
        case type, children
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        let children: [SDIngredient] = (try? container.decode([SDIngredient].self, forKey: .children)) ?? []
        switch type {
        case "layout-page":
            self = .layoutPage(children)
        case "primary-button":
            let model = try? SDButtonModel(from: decoder)
            self = .primaryButton(model)
        case "secondary-button":
            let model = try? SDButtonModel(from: decoder)
            self = .secondaryButton(model)
        case "box":
            let model = try? SDBoxModel(from: decoder)
            self = .box(model)
        case "image-box":
            let model = try? SDImageBoxModel(from: decoder)
            self = .imageBox(model)
        default:
            self = .none
        }
    }
}

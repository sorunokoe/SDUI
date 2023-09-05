//
//  SDViewModel.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 10.08.23.
//

import SwiftUI

protocol SDViewModelProtocol {
    var receipt: SDReceipt { get }
    var components: [SDComponent] { get }
    func fetchUI()
}

class SDViewModel: SDViewModelProtocol, ObservableObject {
    
    let json: MockJSON
    @Published var receipt: SDReceipt = .none
    @Published var components: [SDComponent] = []
    
    init(json: MockJSON) {
        self.json = json
        
        fetchUI()
    }
    
    func fetchUI() {
        Task {
            do {
                let data = try JSONDecoder().decode(SDReceipt.self, from: json.getJSON())
                await MainActor.run {
                    receipt = data
                    preparePage(from: data)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func preparePage(from receipt: SDReceipt) {
        components = []
        switch receipt {
        case let .home(ingredient):
            if let component = prepare(ingredient: ingredient) {
                components.append(component)
            }
        case .none:
            break
        }
    }
    
    func prepare(ingredient: SDIngredient) -> SDComponent? {
        switch ingredient {
        case let .layoutPage(ingredients):
            var components: [SDComponent] = []
            ingredients.forEach {
                if let component = prepare(ingredient: $0) {
                    components.append(component)
                }
            }
            return .layoutPage(components: components)
        case let .primaryButton(model):
            return .primaryButton(title: model?.text ?? "") {
                print("Primary button handled")
            }
        case let .secondaryButton(model):
            return .secondaryButton(title: model?.text ?? "") {
                print("Secondary button handled")
            }
        case let .box(model):
            return .box(title: model?.title ?? "", body: model?.body ?? "")
        case let .imageBox(model):
            return .imageBox(image: model?.image ?? "", title: model?.title ?? "", body: model?.body ?? "")
        default:
            return nil
        }
    }
    
}

//
//  SDUIApp.swift
//  SDUI
//
//  Created by SALGARA, YESKENDIR on 05.09.23.
//

import SwiftUI

@main
struct SDUIApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(json: .home))
        }
    }
}

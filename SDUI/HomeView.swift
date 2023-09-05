//
//  HomeView.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 05.09.23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        SDPageView(viewModel: viewModel)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(json: MockJSON.home))
    }
}

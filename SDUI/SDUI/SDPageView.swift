//
//  PageView.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 05.09.23.
//

import SwiftUI

struct SDPageView: View {
    
    @ObservedObject var viewModel: SDViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(viewModel.components, id: \.id) { component in
                component
            }
        }
    }
    
}

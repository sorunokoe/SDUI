//
//  SDPageLayout.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 05.09.23.
//

import SwiftUI

struct SDPageLayout: View {
    var components: [SDComponent]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(components, id: \.id) { $0 }
                }
            }
        }
    }
}

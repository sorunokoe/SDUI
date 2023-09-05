//
//  MockData.swift
//  ServerDrivenUI
//
//  Created by SALGARA, YESKENDIR on 10.08.23.
//

import Foundation

public enum MockJSON: String {
    case home = "data"
    
    func getJSON() -> Data {
        guard let file = Bundle.main.url(forResource: self.rawValue, withExtension: "json") else { return Data() }
        return (try? Data(contentsOf: file)) ?? Data()
    }
}

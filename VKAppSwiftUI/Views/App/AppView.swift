//
//  AppView.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import SwiftUI

struct AppView: View {
    private let di = DI()
    @AppStorage("vkToken") var token: String?
    
    var body: some View {
        HStack {
            if token == nil {
                di.createAuthView()
            } else {
                di.createTabBar()
            }
        }
    }
}

//
//  VKAppSwiftUIApp.swift
//  VKAppSwiftUI
//
//  Created by Art on 28.02.2022.
//

import SwiftUI

@main
struct VKAppSwiftUIApp: App {
    private let di = DI()
    
    var body: some Scene {
        WindowGroup {
            di.createTabBar()
        }
    }
}

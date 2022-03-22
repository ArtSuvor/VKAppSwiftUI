//
//  VKAppSwiftUIApp.swift
//  VKAppSwiftUI
//
//  Created by Art on 28.02.2022.
//

import SwiftUI

let screen = UIScreen.main.bounds

@main
struct VKAppSwiftUIApp: App {
    private let di = DI()
    
    var body: some Scene {
        WindowGroup {
            AuthorizationView()
//            di.createTabBar()
        }
    }
}

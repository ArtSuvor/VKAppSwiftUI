//
//  GroupsView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Color.white
                    .ignoresSafeArea()
                
            }
            .navigationTitle("Groups")
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}

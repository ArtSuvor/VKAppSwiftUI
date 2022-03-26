//
//  GroupsView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct GroupsView: View {
    let viewModel: GroupViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                List(viewModel.getGroups()) { item in
                    GroupCell(group: item)
                        .listRowInsets(EdgeInsets())
                        .padding(5)
                }
                .listStyle(.inset)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Groups")
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView(viewModel: GroupViewModel())
    }
}

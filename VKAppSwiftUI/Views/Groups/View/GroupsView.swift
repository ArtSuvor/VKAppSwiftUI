//
//  GroupsView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct GroupsView: View {
    @ObservedObject var viewModel: GroupViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                List(viewModel.groups) { item in
                    GroupCell(group: item)
                        .listRowInsets(EdgeInsets())
                        .padding(3)
                }
                .listStyle(.plain)
            }
            .searchable(text: $viewModel.searchText)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Groups")
            .onAppear {
                viewModel.getGroups()
            }
        }
    }
}

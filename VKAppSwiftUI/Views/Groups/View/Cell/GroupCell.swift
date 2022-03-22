//
//  GroupCell.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct GroupCell: View {
    let group: GroupModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("groupsTabColor"))
            
            HStack {
                Image(systemName: group.image)
                    .resizable()
                    .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 5)
                    )
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(group.name)
                        .font(.system(size: 17))
                        .shadow(color: .white, radius: 5)
                    Text("\(group.subscribers)")
                        .font(.system(size: 10))
                    Spacer()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(10)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
}

//
//  GroupCell.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI
import Kingfisher

struct GroupCell: View {
    let group: GroupModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("groupsTabColor"))
            
            HStack {
                createImageView(image: group.image)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 5)
                    )
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(group.name)
                        .font(.system(size: 17))
                        .shadow(color: .white, radius: 5)
                    Text("\(group.subscribers ?? 0)")
                        .font(.system(size: 10))
                    Spacer()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(5)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
    
    private func createImageView(image: String?) -> some View {
        ZStack {
            if let image = image,
               let url = URL(string: image) {
                KFImage(url)
                    .resizable()
                    .cancelOnDisappear(true)
            } else {
                Image(systemName: "person")
                    .resizable()
            }
        }
    }
}

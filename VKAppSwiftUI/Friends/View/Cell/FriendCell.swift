//
//  SwiftUIView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct FriensCell: View {
    private var isOnline: Bool {
        friend.isOnline
    }
    let friend: FriendModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("friendsTabColor"))
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(friend.name)
                        .font(.system(size: 17))
                        .shadow(color: .white, radius: 5)
                    Text(isOnline ? "Online" : "Offline")
                        .font(.system(size: 10))
                        .foregroundColor(isOnline ? .green : .red)
                    Spacer()
                }
                
                Spacer()
                
                Image(systemName: friend.image)
                    .resizable()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 5)
                    )
                    .frame(width: 50, height: 50)
            }
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
}

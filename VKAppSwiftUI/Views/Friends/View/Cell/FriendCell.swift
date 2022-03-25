//
//  SwiftUIView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI
import Kingfisher

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
                    Text(friend.firstName + " " + friend.lastName)
                        .font(.system(size: 17))
                        .shadow(color: .white, radius: 5)
                    Text(isOnline ? "Online" : "Offline")
                        .font(.system(size: 10))
                        .foregroundColor(isOnline ? .green : .red)
                }
                
                Spacer()
                
                createImageView(image: friend.image)
                    .clipShape(Circle())
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 5)
                    )
                    .frame(width: 40, height: 40)
            }
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: 50)
        }
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

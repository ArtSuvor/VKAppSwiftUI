//
//  SwiftUIView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct FriensCell: View {
    private var isOnline: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.gray)
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("NameFriend")
                        .font(.system(size: 20))
                        .shadow(color: .white, radius: 5)
                    Text("Online")
                        .font(.system(size: 13))
                        .foregroundColor(isOnline ? .green : .red)
                }
                
                Spacer()
                
                Image(systemName: "plus")
                    .resizable()
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 5)
                    )
                    .frame(width: 100, height: 100)
            }
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FriensCell()
    }
}

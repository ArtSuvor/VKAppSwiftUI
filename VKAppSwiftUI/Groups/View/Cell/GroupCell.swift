//
//  GroupCell.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct GroupCell: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.gray)
            
            HStack {
                Image(systemName: "plus")
                    .resizable()
                    .background(
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 5)
                    )
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("GroupName")
                        .font(.system(size: 25))
                    
                    Text("Sub")
                        .font(.system(size: 15))
                }
                .shadow(color: .white, radius: 5)
                .padding(10)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupCell()
    }
}

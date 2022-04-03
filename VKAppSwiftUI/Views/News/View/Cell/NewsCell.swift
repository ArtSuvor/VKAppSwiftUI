//
//  NewsView.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import SwiftUI
import Kingfisher

struct NewsCell: View {
    var body: some View {
        VStack {
            createHeader()
                .padding(.horizontal, 10)
            createBodyView()
                .padding(.horizontal, 10)
            createFooter()
                .padding(.horizontal, 10)
        }
    }
    
// MARK: FooterView
    private func createFooter() -> some View {
        HStack {
            HStack {
                Text("0")
                Image(systemName: "plus")
            }
            .padding(5)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.gray))
            
            HStack {
                Text("0")
                Image(systemName: "plus")
            }
            .padding(5)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.gray))
            
            HStack {
                Text("0")
                Image(systemName: "plus")
            }
            .padding(5)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.gray))
            
            Spacer()
            
            HStack {
                Image(systemName: "plus")
                Text("0")
            }
            .padding(5)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.gray))
            .foregroundColor(.white)
        }
    }
    
// MARK: BodyView
    private func createBodyView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("backColorNews"))
            
            VStack {
                Text("adgsjfasjdfhasjkhdfjahskdhfjashdkfhasjdfhjasdkfahsjdfhaskdhfjashdfjkhasjdfhajkshdfhsjkdhfajkshfjahskdfhajshdfkasjhdflajsfhlasjdfhajsdhfjkasdfjshd")
                    .font(.system(size: 15))
                    .padding(10)
                
                //TODO: сделать грид фоток
                createImage(image: "")
                    .frame(maxHeight: 300)
                    .scaledToFit()
            }
        }
    }
    
// MARK: HeaderView
    private func createHeader() -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .frame(maxHeight: 50)
            
            HStack {
                Image(systemName: "plus")
                    .resizable()
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 5)
                    .frame(width: 40, height: 40)
                
                Text("Name")
                    .font(.title2.bold())
                    .padding(.horizontal, 10)
            }
            .padding(5)
            .padding(.horizontal, 5)
        }
    }
    
// MARK: Create Image
    private func createImage(image: String?) -> some View {
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

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell()
    }
}

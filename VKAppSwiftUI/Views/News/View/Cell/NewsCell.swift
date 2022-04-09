//
//  NewsView.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import SwiftUI
import Kingfisher

struct NewsCell: View {
    private let layout = GridItem(.adaptive(minimum: screen.width))
    var news: NewsModel
    
    var body: some View {
        VStack {
            createHeader()
            createBodyView()
            createFooter()
        }
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
        .padding(10)
    }
    
// MARK: FooterView
    private func createFooter() -> some View {
        HStack {
            HStack {
                Text("\(news.likeCount?.count ?? 0)")
                Image(systemName: "plus")
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.gray))
            
            HStack {
                Text("\(news.commentCount?.count ?? 0)")
                Image(systemName: "plus")
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.gray))
            
            HStack {
                Text("\(news.repostCount?.count ?? 0)")
                Image(systemName: "plus")
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.gray))
            
            Spacer()
            
            HStack {
                Image(systemName: "plus")
                Text("\(news.viewsCount?.count ?? 0)")
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.gray))
            .foregroundColor(.white)
        }
        .padding(.bottom, 10)
    }
    
// MARK: BodyView
    private func createBodyView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("backColorNews"))
            
            VStack {
                if let text = news.textNews {
                    Text(text)
                        .font(.system(size: 15))
                        .padding(10)
                }
                
                if let attachments = news.attachments {
                    let images = attachments.compactMap { $0.photo }
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [layout]) {
                            ForEach(images) { image in
                                LazyView(createImage(image: image.sizes.last?.url))
                                    .scaledToFit()
                                    .frame(maxHeight: 400)
                            }
                        }
                    }
                }
                
                //TODO: сделать грид фоток
//                createImage(image: news.attachments?.first?.photo?.sizes.last?.url ?? "")
//                    .frame(maxHeight: 300)
//                    .scaledToFit()
            }
        }
    }
    
// MARK: HeaderView
    private func createHeader() -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .frame(maxHeight: 40)
            
            HStack {
                //TODO: сделать подбор
                Image(systemName: "plus")
                    .resizable()
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 5)
                    .frame(width: 30, height: 30)
                
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

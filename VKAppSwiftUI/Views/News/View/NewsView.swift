//
//  NewsView.swift
//  VKAppSwiftUI
//
//  Created by Art on 03.04.2022.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject var viewModel: NewsViewModel
    
    var body: some View {
        List(viewModel.news) { item in
            LazyView(NewsCell(news: item))
        }
        .onAppear {
            viewModel.getNews()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(viewModel: NewsViewModel(operation: NewsOperation()))
    }
}

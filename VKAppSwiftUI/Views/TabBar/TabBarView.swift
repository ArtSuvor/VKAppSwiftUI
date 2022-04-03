//
//  TabBarView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

//MARK: - Enum Tabs
enum Tabs: String {
    case news = "newspaper"
    case friends = "person.2"
    case groups = "person.3"
}

struct TabBarView: View {
    
//MARK: - Properties
    @State var selectedTab: Tabs
    @State var xAxis: CGFloat = 0
    @Namespace var animation
    private let tabsView: [Tabs] = [.news, .friends, .groups]
    private let friendViewModel: FriendViewModel
    private let groupViewModel: GroupViewModel
    private let friendImageViewModel: FriendImageViewModel
    private let newsViewModel: NewsViewModel
    
//MARK: - Init
    init(selected: Tabs,
         friendViewModel: FriendViewModel,
         groupViewModel: GroupViewModel,
         friendImageViewModel: FriendImageViewModel,
         newsViewModel: NewsViewModel) {
        self.friendViewModel = friendViewModel
        self.groupViewModel = groupViewModel
        self.selectedTab = selected
        self.friendImageViewModel = friendImageViewModel
        self.newsViewModel = newsViewModel
        UITabBar.appearance().isHidden = true
    }
    
//MARK: - Body
    var body: some View {
        ZStack(alignment:
                Alignment(horizontal: .center,
                          vertical: .bottom)) {
            createTabView()
            createButtons()
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
//MARK: - CreateTabView
    private func createTabView() -> some View {
        TabView(selection: $selectedTab) {
            NewsView(viewModel: newsViewModel)
                .ignoresSafeArea(.all, edges: .all)
                .tag(Tabs.news)
            FriendsView(viewModel: friendViewModel, friendImageViewModel: friendImageViewModel)
                .ignoresSafeArea(.all, edges: .all)
                .tag(Tabs.friends)
            GroupsView(viewModel: groupViewModel)
                .ignoresSafeArea(.all, edges: .all)
                .tag(Tabs.groups)
        }
    }
    
//MARK: - CreateButtons
    private func createButtons() -> some View {
        HStack(spacing: 0) {
            ForEach(tabsView, id: \.self) { tab in
                let isSelectedToTab = selectedTab == tab
                GeometryReader { reader in
                    Button {
                        withAnimation(.spring()) {
                            selectedTab = tab
                            xAxis = reader.frame(in: .global).minX
                        }
                    } label: {
                        Image(systemName: tab.rawValue + (isSelectedToTab ? ".fill" : ""))
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(isSelectedToTab ? getImageColor(image: tab) : .gray)
                            .padding(isSelectedToTab ? 15 : 0)
                            .background(Color("tabBarColor")
                                            .opacity(isSelectedToTab ? 1 : 0)
                                            .clipShape(Circle()))
                            .matchedGeometryEffect(id: tab, in: animation)
                            .offset(x: isSelectedToTab ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX + 1) : 0,
                                    y: isSelectedToTab ? -45 : 0)
                            .shadow(color: .white, radius: 5)
                    }
                    .onAppear {
                        if tab == tabsView.first {
                            xAxis = reader.frame(in: .global).minX
                        }
                    }
                }
                .frame(width: 25, height: 25)
                
                if tab != tabsView.last {
                    Spacer(minLength: 0)
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical)
        .background(Color("tabBarColor")
                        .clipShape(CustomShape(xAxis: xAxis))
                        .cornerRadius(10))
        .padding(.horizontal)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
    }
    
//MARK: - GetColorForImageButton
    private func getImageColor(image: Tabs) -> Color {
        switch image {
            case .news:
                return Color("newsTabColor")
            case .friends:
                return Color("friendsTabColor")
            case .groups:
                return Color("groupsTabColor")
        }
    }
}

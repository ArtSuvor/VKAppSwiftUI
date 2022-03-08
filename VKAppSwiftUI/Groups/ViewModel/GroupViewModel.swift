//
//  GroupViewModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import Foundation

final class GroupViewModel {
    private var groups: [GroupModel] = []
    
    init() {
        createGroups()
    }
    
//MARK: - Methods
    func getGroup(index: Int) -> GroupModel {
        groups[index]
    }
    
    func getCountGroups() -> Int {
        groups.count
    }
    
//MARK: - Private Methods
    private func createGroups() {
        let groupOne = GroupModel(name: "dgaf", subscribers: 500, image: "plus")
        let groupTwo = GroupModel(name: "asdfasdf", subscribers: 20000, image: "plus")
        let groupThree = GroupModel(name: "dgadfsdfdf", subscribers: 2000000, image: "plus")
        
        groups.append(groupOne)
        groups.append(groupTwo)
        groups.append(groupThree)
    }
}

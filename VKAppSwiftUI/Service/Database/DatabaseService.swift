//
//  DatabaseService.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import RealmSwift

protocol DatabaseService {
    func save<T: Object> (_ items: [T]) throws -> Realm
    func saveObject<T: Object> (_ item: T) throws -> Realm
    func get<T: Object, KeyType> (_ type: T.Type, primaryKey: KeyType) throws -> T?
    func get<T: Object> (_ type: T.Type) throws -> Results<T>
    func delete<T: Object> (_ items: T) throws
    func deleteArray<T: Object> (_ items: [T]) throws
}

final class DatabaseServiceImpl: DatabaseService {
     
    //сохраняем в бд массив
    func save<T: Object> (_ items: [T]) throws -> Realm {
        let realm = try Realm(configuration: .defaultConfiguration)
        try realm.write {
            realm.add(items, update: .all)
        }
        return realm
    }
    
    //сохраняем один объект
    func saveObject<T: Object> (_ item: T) throws -> Realm {
        let realm = try Realm()
        try realm.write {
            realm.add(item, update: .all)
        }
        return realm
    }
    
    //извлекаем из бд по ключу
    func get<T: Object, KeyType>(_ type: T.Type, primaryKey: KeyType) throws -> T? {
        let realm = try Realm()
        return realm.object(ofType: type, forPrimaryKey: primaryKey)
    }
    
    //извлекаем из бд
    func get<T: Object> (_ type: T.Type) throws -> Results<T> {
        let realm = try Realm()
        return realm.objects(type)
    }
    
    //удаляем из бд один объект
    func delete<T: Object> (_ items: T) throws {
        let realm = try Realm()
        try realm.write {
            realm.delete(items)
        }
    }
    
    //удаляем массив объектов
    func deleteArray<T: Object> (_ items: [T]) throws {
        let realm = try Realm()
        try realm.write {
            realm.delete(items)
        }
    }
}

//
//  FavoriteManager.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

enum StoreKeys: String {
    case favorites
}

class FavoriteManager {
    
    static let shared = FavoriteManager()
    
    let storage = UserDefaults.standard
    
    var favorites: [DriversListViewModel] {
        get {
            if let jsonData = self.storage.object(forKey: StoreKeys.favorites.rawValue) as? Data {
                if let model = self.decode(data: jsonData, model: [DriversListViewModel].self) {
                    return model
                } else {
                    return []
                }
            } else {
                return []
            }
        } set {
            if let jsonData = self.encode(model: newValue) {
                self.storage.set(jsonData, forKey: StoreKeys.favorites.rawValue)
            }
        }
    }
    
    var favoriteCount: Int {
        return self.favorites.count
    }
    
    func pushFavorite(driver: DriversListViewModel) {
        var favorites = self.favorites
        favorites.append(driver)
        self.favorites = favorites
    }
    
    @discardableResult
    func popFavorite(driver: DriversListViewModel) -> DriversListViewModel? {
        if favorites.contains(where: {$0 == driver}) {
            var favorites = self.favorites
            favorites.removeAll(where: {$0 == driver})
            self.favorites = favorites
            return driver
        } else {
            return nil
        }
    }
    
    func removeAllFavorites() {
        self.favorites = []
    }
    
    func isFavoritesContains(_ id: Int) -> Bool {
        return favorites.contains(where: {$0.id == id})
    }
    
    func decode<T:Decodable>(data:Data, model: T.Type) -> T? {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        }
        catch {
            print("* * * * ** * * * ** * * * ** * * * * JSON PARSE ERROR * * * * * * * * * * * * * * *")
            print(error)
            
        }
        return nil
        
    }
    
    func encode<T:Encodable>(model: T) -> Data? {
        
        if let jsonData = try? JSONEncoder().encode(model) {
            return jsonData
        }
        
        return nil
    }
}

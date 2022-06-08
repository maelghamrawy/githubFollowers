//
//  persitenceManager.swift
//  githubFollowers
//
//  Created by Mahmoud on 06/06/2022.
//

import Foundation

enum presitenceActiontype{
    case add, remove
}


enum persitenceManager {
    
    static private let defualts = UserDefaults.standard
    
    enum keys {
        static let favorites = "favorites"
        
    }
    
    
    static func updateWith(favorite: Follower, actionType: presitenceActiontype, completed: @escaping (GFError?) -> Void ) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrieveFavorite = favorites
                
                switch actionType{
                    
                case.add:
                    guard !retrieveFavorite.contains(favorite) else {
                        completed(.alreadyInFavorite)
                        return
                    }
                    retrieveFavorite.append(favorite)
                    
                case.remove:
                    retrieveFavorite.removeAll {$0.login == favorite.login}
                }
                
                 completed(save(favorites: retrieveFavorite))
                 
            case.failure(let error):
                completed(error)
            }
        }
        
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void ) {
        
        guard let favoriteData = defualts.object(forKey: keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do{
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoriteData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorites))
        }
  
    }
    
   static func save(favorites: [Follower]) -> GFError? {
        
        do{
            let encoder = JSONEncoder()
            let encoderFavorites = try encoder.encode(favorites)
            UserDefaults.standard.set(encoderFavorites, forKey: keys.favorites)
            return nil
        } catch{
            return .unableToFavorites
        }
    }
  
    
}

//
//  NetworkManager.swift
//  githubFollowers
//
//  Created by Mahmoud on 22/05/2022.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    let baseUrl =  "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers (for username: String, page: Int, completed: @escaping ([Follower]?, String?) ->  Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an valid request. please try again")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _  = error {
                completed(nil, "unable to complete your requs. please check the internet")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "invalid response from the server. please try again")
                return
            }
            guard let data = data else {
                completed(nil, "the data fron the server was invalid. please try again")
                return
            }
            
            do{//pasrsing the data
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
                
            }catch{
                completed(nil, "the data fron the server was invalid. please try again")
            }
            
        }
        task.resume()
    }
  
}

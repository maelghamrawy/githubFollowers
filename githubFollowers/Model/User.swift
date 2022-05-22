//
//  User.swift
//  githubFollowers
//
//  Created by Mahmoud on 22/05/2022.
//

import Foundation


struct User: Codable {
    
    var login: String
    var avaterUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
    

}

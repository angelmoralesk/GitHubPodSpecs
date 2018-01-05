//
//  GHOwner.swift
//  GitHubServices
//
//  Created by Angel Jesse Morales Karam Kairuz on 05/01/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import Foundation

public struct GHOwner {
    public let login : String
    public let id : Int
    public let avatar_url : String
    
    public init(login : String, id: Int, avatar_url: String) {
        self.login = login
        self.id = id
        self.avatar_url = avatar_url
    }
    
}

extension GHOwner : Decodable {
    
    enum GHOwnerKeys : String, CodingKey {
        case login  = "login"
        case id = "id"
        case avatar_url = "avatar_url"
    }
    
   public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GHOwnerKeys.self)
        let login : String = try container.decode(String.self, forKey: .login)
        let id : Int = try container.decode(Int.self, forKey: .id)
        let avatar_url : String = try container.decode(String.self, forKey: .avatar_url)
        self.init(login: login, id: id, avatar_url: avatar_url)
    }
}

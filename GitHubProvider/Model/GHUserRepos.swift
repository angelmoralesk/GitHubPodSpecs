//
//  GitHubResults.swift
//  GitHubServices
//
//  Created by Angel Jesse Morales Karam Kairuz on 04/01/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import Foundation

struct GHUserRepo {
    
    let id : Int
    let name : String
    let owner : GHOwner
    let description : String?
    
    init(id : Int, name : String, owner : GHOwner, description : String?) {
        self.id = id
        self.name = name
        self.owner = owner
        self.description = description
    }
    
}

extension GHUserRepo : Decodable {
    
    enum GHUserRepoKeys: String, CodingKey  {
        case id = "id"
        case name = "name"
        case owner = "owner"
        case description = "description"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GHUserRepoKeys.self)
        let id : Int = try container.decode(Int.self, forKey: .id)
        let name : String = try container.decode(String.self, forKey: .name)
        let owner  = try container.decode(GHOwner.self, forKey: .owner)
        
        let description : String? = try container.decodeIfPresent(String.self, forKey: .description)
        
        self.init(id: id, name: name, owner: owner, description: description)
    }
}

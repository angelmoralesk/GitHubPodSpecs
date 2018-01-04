//
//  GitHubService.swift
//  GitHubProvider
//
//  Created by Angel Jesse Morales Karam Kairuz on 04/01/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import Foundation
import Moya

enum GitHubService {
    
    case showReposFrom(user : String)

}

extension GitHubService : TargetType {
   
    var sampleData: Data {
        return "".utf8Encoded
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }

    var baseURL: URL { return URL(string: "https://api.github.com")! }
    var path: String {
        switch self {
        case .showReposFrom(user: let user):
            return "/users/\(user)/repos"
        default:
            return ""
        }
    }
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
}

// MARK: - Helpers
private extension String {
    
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

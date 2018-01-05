//
//  GitHubProviderProxy.swift
//  GitHubProvider
//
//  Created by Angel Jesse Morales Karam Kairuz on 04/01/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import Foundation
import Moya

public class GitHubProvider {
    
    public static func fetchRepositories(userId : String, completion: @escaping (_ success : Bool,_ repositories : [GHUserRepo],_ error : NSError?)->()) {
        
        let provider = MoyaProvider<GitHubService>()
        provider.request(.showReposFrom(user: userId)) { result in
           
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data // Data, your JSON response is probably in here!
                let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc
                do {
                    let ghUserRepos = try JSONDecoder().decode([GHUserRepo].self, from: data)
                    print(ghUserRepos)
                    completion(true, ghUserRepos, nil)
                } catch {
                    completion(false, [], nil)
                }
                
            // do something in your app
            case let .failure(error):
                completion(false, [], nil)
               
            }
        }
        
    }
    
}


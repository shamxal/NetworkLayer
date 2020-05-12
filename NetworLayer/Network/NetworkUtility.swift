//
//  NetworkUtility.swift
//  NetworLayer
//
//  Created by Shamkhal on 5/12/20.
//

import Alamofire

enum Api: String {
    case baseUrl = "https://free-nba.p.rapidapi.com/"
}

struct Header {
    static let shared = Header()
    
    func header() -> HTTPHeaders {
        ["x-rapidapi-host": "free-nba.p.rapidapi.com", "x-rapidapi-key": "e9b5087aacmshbdbc4f4badde021p1ca000jsned35a90a895c"]
    }
}

enum NetworkResponse<T> {
    case success(T)
    case messageFailure(ErrorMessage)
}

enum Endpoint: String {
    case teams = "teams"
}

enum Request {
    case teams
    
    var path: String {
        switch self {
        case .teams:
            return requestUrl(url: Endpoint.teams.rawValue)
        }
    }
    
    func requestUrl(url: String) -> String {
        return Api.baseUrl.rawValue + url
    }
}

extension Data {
    func decode<T: Decodable>() throws -> T {
        return (try! JSONDecoder().decode(T.self, from: self))
    }
}

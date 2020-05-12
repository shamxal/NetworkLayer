//
//  Team.swift
//  NetworLayer
//
//  Created by Shamkhal on 5/12/20.
//

import Foundation

//MARK: Team
struct Team: Codable {
    let data: [TeamData]?
    let meta: Meta?
}

//MARK: TeamData
struct TeamData: Codable {
    let id: Int?
    let abbreviation: String?
    let city: String?
    let conference: String?
    let division: String?
    let full_name: String?
    let name: String?
}

//MARK: Meta
struct Meta: Codable {
    let totalPage: Int?
    let currentPage: Int?
    let nextPage: Int?
    let perPage: Int?
    let totalCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case totalPage = "total_pages"
        case currentPage = "current_page"
        case nextPage = "next_page"
        case perPage = "per_page"
        case totalCount = "total_count"
    }
}

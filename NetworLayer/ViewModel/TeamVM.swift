//
//  TeamVM.swift
//  NetworLayer
//
//  Created by Shamkhal on 5/12/20.
//

import Foundation

class TeamVM {
    func getAllTeams(success: @escaping([TeamData])->(), failure: @escaping(ErrorMessage)->()) {
        NetworkRequest.shared.get(type: Team.self, url: Request.teams.path) { response in
            switch response {
            case .success(let team):
                if let data = team.data {
                    success(data)
                }
            case .messageFailure(let errorMessage):
                failure(errorMessage)
            }
        }
    }
}

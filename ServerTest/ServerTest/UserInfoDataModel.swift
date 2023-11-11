//
//  UserInfoDataModel.swift
//  ServerTest
//
//  Created by Gahyun Kim on 2023/11/11.
//

import Foundation

// MARK: - UserInfoDataModel
struct UserInfoDataModel: Codable {
    let username, nickname: String
    
    enum CodingKeys: CodingKey {
        case username
        case nickname
    }
}

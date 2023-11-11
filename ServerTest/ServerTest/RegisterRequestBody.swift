//
//  RegisterRequestBody.swift
//  ServerTest
//
//  Created by Gahyun Kim on 2023/11/11.
//

import Foundation

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let nickname: String
}

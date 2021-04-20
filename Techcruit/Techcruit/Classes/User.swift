//
//  User.swift
//  Techcruit
//
//  Created by Andy Tran on 2021-04-19.
//

import Foundation

public struct User: Codable {

    let firstname: String
    let lastname: String?
    let email: String?
    let password: String?
    let uid: String?

    enum CodingKeys: String, CodingKey {
        case firstname
        case lastname
        case email
        case password
        case uid
    }

}

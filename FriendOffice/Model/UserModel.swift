//
//  UserModel.swift
//  FriendOffice
//
//  Created by Netaxis on 06/08/25.
//

import Foundation


struct UserModel: Codable {
    let id:  UUID
    var name: String
    var email: String
    var password : String
    var followers : [String] = []
}

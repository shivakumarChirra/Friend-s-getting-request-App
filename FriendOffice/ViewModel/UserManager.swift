//
//  FriendModel.swift
//  FriendOffice
//
//  Created by Netaxis on 06/08/25.
//

import Foundation

class Variables: Identifiable, ObservableObject {
    @Published var alertMessage: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var message: String = ""
    @Published var showMessage : Bool = false
    @Published var Navigate : Bool = false
    @Published var showAlert: Bool = false
    @Published var isLoggedIn: Bool = false
    init(){}
}

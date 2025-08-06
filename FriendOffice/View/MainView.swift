//
//  MainView.swift
//  FriendOffice
//
//  Created by shivakumar chirra on 06/08/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var variables = Variables()

    var body: some View {
        NavigationStack {
            if variables.isLoggedIn {
                FriendMainView(variables: variables)
            } else {
                LoginView(variables: variables)
            }
        }
    }
}

#Preview {
    MainView()
}



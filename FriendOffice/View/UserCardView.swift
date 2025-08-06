//
//  UserCardView.swift
//  FriendOffice
//
//  Created by Netaxis on 06/08/25.
//

import SwiftUI
import CoreData

struct UserCardView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var users: [User] = []
    @ObservedObject var variables: Variables

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(users.filter { $0.email != variables.email }) { user in
                    UserCardRow(user: user, currentUserEmail: variables.email)
                }
            }
        }
        .onAppear {
            let fetchRequest = NSFetchRequest<User>(entityName: "User")
            do {
                users = try viewContext.fetch(fetchRequest)
            } catch {
                print(" Failed to fetch users: \(error)")
            }
        }
    }
}


#Preview {
    UserCardView(variables: Variables())
}

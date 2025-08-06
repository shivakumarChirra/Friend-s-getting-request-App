//
//  UserCardView.swift
//  FriendOffice
//
//  Created by Netaxis on 06/08/25.
//

import SwiftUI

struct UserCardRow: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var user: User
    let currentUserEmail: String
    @State private var isFollowing = false
    @State private var showDeleteAlert = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Name: \(user.name ?? "")")
                    Text("Email: \(user.email ?? "")")
                }
                
                Spacer()
                
                Toggle(isOn: $isFollowing) {
                    Text(isFollowing ? "Following" : "Follow")
                }
                .onChange(of: isFollowing) { 
                    handleFollow()
                }
            }

            //  Delete Button
            HStack {
                Spacer()
                Button(action: {
                    showDeleteAlert = true
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .padding(6)
                }
                .alert("Delete User", isPresented: $showDeleteAlert) {
                    Button("Delete", role: .destructive, action: deleteUser)
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Are you sure you want to delete this user?")
                }
            }
        }
        .padding()
        .background(Color("card"))
        .cornerRadius(12)
    }

    private func handleFollow() {
        let message = "\(currentUserEmail) followed you"
        if let existing = user.notificationMessage, !existing.isEmpty {
            user.notificationMessage = existing + "\n" + message
        } else {
            user.notificationMessage = message
        }
        try? viewContext.save()
    }

    //  Delete User from Core Data
    private func deleteUser() {
        viewContext.delete(user)
        do {
            try viewContext.save()
        } catch {
            print(" Failed to delete user: \(error)")
        }
    }
}



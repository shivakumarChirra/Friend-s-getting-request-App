//
//  FriendOfficeApp.swift
//  FriendOffice
//
//  Created by Netaxis on 06/08/25.
//

import SwiftUI
import CoreData
@main
struct FriendOfficeApp: App {
    @StateObject private var coreDataStack = CoreDataStack.shared
   // let persistantController = coreDataStack.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext,coreDataStack.persistentContainer.viewContext)
        }
    }
}

//
//  DataManager.swift
//  FriendOffice
//
//  Created by Netaxis on 06/08/25.
//

import Foundation
import CoreData

class CoreDataStack: ObservableObject {
    static let shared = CoreDataStack()
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
        return container
    }()
        
    private init() { }
}


//
//  Playlist+Convenience.swift
//  PlaylistCoreData
//
//  Created by Blake kvarfordt on 8/7/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
    convenience init(name: String, song: [Song] = [], moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.name = name
    }
}

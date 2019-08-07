//
//  Song+Convenience.swift
//  PlaylistCoreData
//
//  Created by Blake kvarfordt on 8/7/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    
    @discardableResult // IDK why, but Karl said to
    convenience init(title: String, artist: String, playlist: Playlist, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.title = title
        self.artist = artist
        self.playlist = playlist
    }
}

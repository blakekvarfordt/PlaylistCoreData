//
//  SongController.swift
//  PlaylistCoreData
//
//  Created by Blake kvarfordt on 8/7/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    // Create
    static func createSong(title: String, artist: String, playlist: Playlist) {
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    // Delete
    func deleteSong(song: Song) {
        CoreDataStack.context.delete(song)
        PlaylistController.shared.saveToPersistentStore()
    }
}

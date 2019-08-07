//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by Blake kvarfordt on 8/7/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    // Local Source of Truth
    var playlists: [Playlist] {
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    // Create
    func createPlaylist(name: String) {
        let _ = Playlist(name: name)
        saveToPersistentStore()
    }
    // Delete
    func deletePlaylist(playlist: Playlist) {
        CoreDataStack.context.delete(playlist)
        saveToPersistentStore()
    }
    // Save
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("error saving objects in \(#function): \(error.localizedDescription)")
        }
        
    }
}

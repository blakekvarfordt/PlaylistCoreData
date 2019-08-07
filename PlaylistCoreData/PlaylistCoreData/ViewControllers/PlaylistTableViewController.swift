//
//  PlaylistTableViewController.swift
//  PlaylistCoreData
//
//  Created by Blake kvarfordt on 8/7/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    @IBOutlet weak var playlistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        guard let name = playlistNameTextField.text else { return }
        PlaylistController.shared.createPlaylist(name: name)
        tableView.reloadData()
        playlistNameTextField.text = ""
        
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PlaylistController.shared.playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        let songCount = playlist.songs?.count ?? 0
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(songCount)"

        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.deletePlaylist(playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailVC" {
            guard let index = tableView.indexPathForSelectedRow, let destination = segue.destination as? SongTableViewController else { return }
            let playlist = PlaylistController.shared.playlists[index.row]
            destination.playlist = playlist
        }
    }
    

}

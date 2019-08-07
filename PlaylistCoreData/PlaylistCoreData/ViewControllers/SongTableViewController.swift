//
//  SongTableViewController.swift
//  PlaylistCoreData
//
//  Created by Blake kvarfordt on 8/7/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    // Landing Pad
    var playlist: Playlist?
    
    @IBOutlet weak var songNameLa: UITextField!
    @IBOutlet weak var artistNameLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let title = songNameLa.text, let artist = artistNameLabel.text, let playlist = self.playlist else { return }
            
            SongController.createSong(title: title, artist: artist, playlist: playlist)
        tableView.reloadData()
        songNameLa.text = ""
        artistNameLabel.text = ""
        
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)

        guard let playlist = playlist, let song = playlist.songs?[indexPath.row] as? Song else { return UITableViewCell()}
        
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artist

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist, let song = playlist.songs?[indexPath.row] as? Song else { return }
            let songController = SongController()
            songController.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

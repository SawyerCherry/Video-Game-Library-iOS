//
//  ViewController.swift
//  Video Game Library iOS
//
//  Created by Sawyer Cherry on 10/15/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var gameListTableView: UITableView!
    
    var currentGame: Game!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gameListTableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            GameDetailsViewController {
            destination.gameDescription = currentGame
        }
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        self.performSegue(withIdentifier: "showGameDetails", sender: self)
    }
    func crashProgram(){
        
    }
    // 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GameTableViewCell
        
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        
        cell.titleLabel.text = gameForIndex.title
        cell.genreLabel.text = gameForIndex.genre
        cell.ratingLabel.text = gameForIndex.rating
        
        
        if gameForIndex.checkedIn {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        if let duedate = gameForIndex.dueDate {
            cell.dateLabel.text = formatDate(duedate)
        } else {
            cell.dateLabel.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // This allows us to return an array of actions that the row will have (if any)
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _,_ in
            //Remove the game at the currentGame
            GameManager.sharedInstance.removeGame(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        let title = gameForIndex.checkedIn ? "Check Out" : "Check In"
        let checkInOrOutAction = UITableViewRowAction(style: .normal, title: title) { _, _ in
            GameManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        let showShowEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit") {_, _ in
            self.currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
            self.performSegue(withIdentifier: "showEditGameScreen", sender: self)
        }
        showShowEditScreenAction.backgroundColor = UIColor.blue
        return [deleteAction, checkInOrOutAction, showShowEditScreenAction]
    }
    
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) {}
}


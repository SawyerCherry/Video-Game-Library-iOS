//
//  GameManager.swift
//  Video Game Library iOS
//
//  Created by Sawyer Cherry on 10/17/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import Foundation
import RealmSwift

// The game manager class will use realm to givem e persistance and it will keep the games added to the library
class GameManager {
    static let sharedInstance = GameManager()
    
    private init() {
       gameArray = realm.objects(Game.self)
    }
    
    private var gameArray: Results<Game>!
    
    let realm = try! Realm()
    
    func getGameCount() -> Int {
        return gameArray.count
    }
    func getGame(at index: Int) -> Game {
        return gameArray[index]
    }
    func addGame(game: Game) {
        try! realm.write {
            realm.add(game)
        }
    }
    // Realm will keep which games I have removed
    func removeGame(at index: Int) {
        try! realm.write {
            realm.delete(getGame(at: index))
        }
    }
    func checkGameInOrOut(at index: Int) {
        
        let gameForIndex = gameArray[index]
        try! realm.write {
        gameForIndex.checkedIn = !gameForIndex.checkedIn
        
        if gameForIndex.checkedIn {
            gameForIndex.dueDate = nil
        } else {
            // This is going to set my dueDate giving three days when the game is checked out.
            gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 3, to: Date())
            }
        }
    }
}

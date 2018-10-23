//
//  GameClass.swift
//  Video Game Library iOS
//
//  Created by Sawyer Cherry on 10/16/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import Foundation
import RealmSwift

class Game: Object {
   //Properties of game
     @objc dynamic var title: String = ""
     @objc dynamic var checkedIn: Bool = true
     @objc dynamic var genre: String = ""
     @objc dynamic var rating: String = ""
     @objc dynamic var dueDate: Date? = nil
     @objc dynamic var gameDescription: String = ""
}

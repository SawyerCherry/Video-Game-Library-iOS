//
//  GameDetailsViewController.swift
//  Video Game Library iOS
//
//  Created by Sawyer Cherry on 10/19/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import UIKit

class GameDetailsViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var gameDescription: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = gameDescription.gameDescription
    }
}

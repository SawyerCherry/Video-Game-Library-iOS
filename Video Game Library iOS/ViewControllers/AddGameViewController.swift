//
//  AddGameViewController.swift
//  Video Game Library iOS
//
//  Created by Sawyer Cherry on 10/17/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var gameTitleTextField: UITextView!
    @IBOutlet weak var gameDescriptionTextField: UITextView!
    @IBOutlet weak var ratingSegmentedControll: UISegmentedControl!
    @IBOutlet weak var genrePicker: UIPickerView!
    
    let genres = ["Action", "Sandbox", "Open World", "Strategy", "Shooter", "Racing", "Survival", "Platform"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GameManager.sharedInstance.getGameCount()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let title = gameTitleTextField.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "", let gameDescription = gameDescriptionTextField.text
            else {
            return
        }
        // This sets The ratings options and ties them to a switch statement
        var rating: String!
        switch ratingSegmentedControll.selectedSegmentIndex {
        case 0:
            rating = "E"
        case 1:
            rating = "E10+"
        case 2:
            rating = "T"
        case 3:
            rating = "M"
        case 4:
            rating = "AO"
        default:
            rating = "E"
            
        }
        
        let genre = genres[genrePicker.selectedRow(inComponent: 0)]
        // Default init for the game class, this will create a game using the default values that were set in the game class
        
        let newGame = Game()
        // Setting the properties for the new game using dot notation.
        newGame.title = title
        newGame.gameDescription = gameDescription
        newGame.genre = genre
        newGame.rating = rating
        
        GameManager.sharedInstance.addGame(game: newGame)
        
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
}

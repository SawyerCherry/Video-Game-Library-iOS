//
//  Utilities.swift
//  Video Game Library iOS
//
//  Created by Sawyer Cherry on 10/18/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import Foundation

func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    // This will set my date format in the label and implement the style of the label
    dateFormatter.dateFormat = "MMM d, yyyy"
    let formattedString = dateFormatter.string(from: date)
    return formattedString
}

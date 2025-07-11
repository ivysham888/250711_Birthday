//
//  Friend.swift
//  250711_Birthday
//
//  Created by Ivy Sham on 11/7/2025.
//

import Foundation

class Friend {
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
        // self separates property of class AND the parameter
        // self is the property -- set property (self.name) to the passed in parameter (name)
    }
}

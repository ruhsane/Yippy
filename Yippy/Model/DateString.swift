//
//  Date+String.swift
//  Mood-Tracker
//
//  Created by Ryan Nguyen on 11/16/18.
//  Copyright © 2018 Danh Phu Nguyen. All rights reserved.
//

import Foundation

extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .short)
    }
}

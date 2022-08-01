//
//  DateFormat.swift
//  Training
//
//  Created by phuocanh on 25/07/2022.
//

import Foundation

class DateFomat {
    static func formatFromString(date: String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let newDate = dateFormatter.date(from: date!)
//        dateFormatter.string(from: newDate!)
        print("DATE:  \(newDate)")
        return "12"
    }
}

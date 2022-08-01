//
//  Color.swift
//  Training
//
//  Created by phuocanh on 21/07/2022.
//

import Foundation
import SwiftUI

extension Color {
    static var theme = ColorTheme()
}

struct ColorTheme {
    let background = Color("BackgroundColor")
    let background100 = Color("Background100") //-> background compnents
    let background200 = Color("Background200") // -> appBar, bottomBar
    let primary = Color("PrimaryColor")
    let secondary = Color("SecondaryColor")
    let textPrimary = Color("PrimaryText")
    let textSecondary = Color("SecondaryText")
    let error = Color("Error")
    let success = Color("Success")
}

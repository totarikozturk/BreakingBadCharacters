//
//  StringExtension.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 28.09.2022.
//

import Foundation

// MARK: String for localization
extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}

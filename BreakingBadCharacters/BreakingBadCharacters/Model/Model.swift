//
//  Model.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 28.09.2022.
//

import Foundation

// MARK: - BreakingBad API model

typealias Search = [SearchElement]

struct SearchElement: Codable {
    let name: String
    let img: String
    let nickname: String

    enum CodingKeys: String, CodingKey {
        case name, img, nickname
    }
}

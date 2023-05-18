//
//  CreateCharacterConfigDTO.swift
//  
//
//  Created by Anton Goncharov on 12.05.2023.
//

import Foundation
import DnDCore

struct CreateCharacterConfigDTO: Codable {
    var classes = Class.allCases.map(\.rawValue)
    var races = Race.allCases.map(\.rawValue)
    var alignments =
    Alignment.Ethic.allCases
        .crossJoin(array: Alignment.Moral.allCases,
                   joiner: Alignment.init)
        .map(\.description)
}

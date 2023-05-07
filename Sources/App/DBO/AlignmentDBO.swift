//
//  AlignmentDBO.swift
//  
//
//  Created by Anton Goncharov on 29.04.2023.
//

import Foundation


import Fluent
import DnDCore

final class AlignmentDBO: Fields {
    @Enum(key: "ethic")
    var ethic: Alignment.Ethic

    @Enum(key: "moral")
    var moral: Alignment.Moral

    init() {}

    init(ethic: Alignment.Ethic, moral: Alignment.Moral) {
        self.ethic = ethic
        self.moral = moral
    }
}

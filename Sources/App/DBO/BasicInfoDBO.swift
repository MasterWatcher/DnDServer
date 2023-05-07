//
//  BasicInfoDBO.swift
//  
//
//  Created by Anton Goncharov on 26.04.2023.
//

import Fluent
import DnDCore

final class BasicInfoDBO: Fields {

    @Field(key: "name")
    var name: String

    @Enum(key: "class")
    var `class`: Class

    @Field(key: "background")
    var background: String

    @Enum(key: "race")
    var race: Race

    @Group(key: "alignment")
    var alignment: AlignmentDBO

    @Field(key: "experience")
    var experience: Int

    init() { }

    init(
        name: String,
        `class`: Class,
        background: String,
        race: Race,
        alignment: AlignmentDBO,
        experience: Int) {
            self.name = name
            self.class = `class`
            self.background = background
            self.race = race
            self.alignment = alignment
            self.experience = experience
        }
}

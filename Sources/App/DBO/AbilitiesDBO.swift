//
//  AbilitiesDBO.swift
//  
//
//  Created by Anton Goncharov on 10.05.2023.
//

import Fluent
import DnDCore

final class AbilitiesDBO: Fields {

    @Field(key: "strength")
    var strength: Int

    @Field(key: "dexterity")
    var dexterity: Int

    @Field(key: "constitution")
    var constitution: Int

    @Field(key: "intelligence")
    var intelligence: Int

    @Field(key: "wisdom")
    var wisdom: Int

    @Field(key: "charisma")
    var charisma: Int

    init() { }

    init(
        strength: Int,
        dexterity: Int,
        constitution: Int,
        intelligence: Int,
        wisdom: Int,
        charisma: Int
    ) {
        self.strength = strength
        self.dexterity = dexterity
        self.constitution = constitution
        self.intelligence = intelligence
        self.wisdom = wisdom
        self.charisma = charisma
    }
}

extension AbilitiesDBO {
    convenience init(_ abilities: Abilities)  {
        self.init(
            strength: abilities.strength,
            dexterity: abilities.dexterity,
            constitution: abilities.constitution,
            intelligence: abilities.intelligence,
            wisdom: abilities.wisdom,
            charisma: abilities.charisma
        )
    }
}

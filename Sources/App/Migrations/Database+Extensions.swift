//
//  Database+Extensions.swift
//  
//
//  Created by Anton Goncharov on 28.04.2023.
//

import Fluent

extension Database {
    func `enum`<EnumType: CaseIterable & RawRepresentable<String>>(name: String, _ enumType: EnumType.Type) -> EnumBuilder {
        var builder = self.enum(name)
        for option in enumType.allCases {
            builder = builder.case(option.rawValue)
        }
        return builder
    }
}

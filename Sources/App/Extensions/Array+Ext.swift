//
//  Array+Ext.swift
//  
//
//  Created by Anton Goncharov on 12.05.2023.
//

import Foundation

extension Array
{
    func crossJoin<E, R>(
        array:  [E],
        joiner: (Element, E) -> R?)
        -> [R]
    {
        return arrayCrossJoin(self, array, joiner)
    }
}

func arrayCrossJoin<A, B, R>(
    _ aArray: [A],
    _ bArray: [B],
    _ joiner: (A, B) -> R?)
    -> [R]
{
    var results = [R]()
    for a in aArray
    {
        for b in bArray
        {
            if let result = joiner(a, b)
            {
                results.append(result)
            }
        }
    }
    return results
}

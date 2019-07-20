//
//  Project_29.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-18.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project29()
{
    var result:Set<String> = []
    
    for a in 2...100
    {
        for b in 2...100
        {
            result.insert(PowerAsString(base: a, power: b))
        }
    }
    
    print(result.count)
}

func PowerAsString(base:Int, power:Int) -> String
{
    let digits = RepresentPower(base: base, power: power)
    
    var result = ""
    
    for nextDigit in digits
    {
        result += "\(nextDigit)"
    }
    
    return result
}

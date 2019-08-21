//
//  Project_48.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-06.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

// YAY! I did one on my own for a change!

import Foundation

func Project48()
{
    let hilimit = 1000
    let numDigits = 10
    
    var sum:[Int] = [1]
    for i in 2...hilimit
    {
        let nextPower = RepresentPower(base: i, power: i)
        
        sum = AddFinalDigits(a: sum, b: nextPower, numDigits: numDigits)
    }
    
    print(sum)
}

func AddFinalDigits(a:[Int], b:[Int], numDigits:Int) -> [Int]
{
    // Take the last numDigits of a, add them to the last numDigits of b, and return the result
    
    // pad a and/or b as needed to get to numDigits
    var aFixed:[Int] = a.reversed()
    var bFixed:[Int] = b.reversed()
    
    while aFixed.count < numDigits
    {
        aFixed.append(0)
    }
    
    while bFixed.count < numDigits
    {
        bFixed.append(0)
    }
    
    var result:[Int] = []
    var carry = 0
    
    for i in 0..<numDigits
    {
        let nextSum = aFixed[i] + bFixed[i] + carry
        
        result.append(nextSum % 10)
        carry = nextSum / 10
    }
    
    return result.reversed()
}



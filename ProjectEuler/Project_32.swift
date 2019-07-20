//
//  Project_32.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-19.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project32()
{
    var resultSet:Set<Int> = []
    
    for a in 1..<3000
    {
        for b in (a+1)..<3000
        {
            if TestForPandigitalProduct(a: a, b: b)
            {
                print("\(a) * \(b) = \(a * b)")
                
                resultSet.insert(a * b)
            }
        }
    }
    
    var sum = 0
    
    for nextProduct in resultSet
    {
        sum += nextProduct
    }
    
    print("Sum: \(sum)")
}

func TestForPandigitalProduct(a:Int, b:Int) -> Bool
{
    let c = a * b
    
    var digitArray = DigitArray(n: a)
    digitArray += DigitArray(n: b)
    digitArray += DigitArray(n: c)
    
    if digitArray.contains(0)
    {
        return false
    }
    
    if digitArray.count != 9
    {
        return false
    }
    
    var digitSet = Set(digitArray)
    
    return digitSet.count == 9
}

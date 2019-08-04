//
//  Project_38.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-20.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project38()
{
    for base in 1...100000
    {
        var digitArrays:[[Int]] = []
        
        for i in 1...10
        {
            let newArray = DigitArray(n: base * i)
            
            digitArrays.append(newArray)
            
            let concat = ConcatenateDigits(digitArrays: digitArrays)
            
            if concat.count == 9
            {
                if TestForPandigitalArray(digits: concat)
                {
                    print("Base: \(base), n = \(i), Concatenation: \(DigitsAsString(digits: concat))")
                }
            }
            else if concat.count > 9
            {
                break
            }
        }
    }
}

func TestForPandigitalArray(digits:[Int]) -> Bool
{
    let n = digits.count
    
    if digits.contains(0)
    {
        return false
    }
    
    let digitSet:Set<Int> = Set(digits)
    
    for nextDigit in digitSet
    {
        if nextDigit > n
        {
            return false
        }
    }
    
    return digitSet.count == n
}

func ConcatenateDigits(digitArrays:[[Int]]) -> [Int]
{
    var result:[Int] = []
    
    for nextArray in digitArrays
    {
        for nextDigit in nextArray
        {
            result.append(nextDigit)
        }
    }
    
    return result
}

//
//  Project_23.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-16.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project23()
{
    var abundants:[Int] = []
    
    // create the set of abundant numbers from 12 to 28123
    for i in 12..<28124
    {
        if IsAbundant(x: i)
        {
            abundants.append(i)
        }
    }
    
    print("Num abundants: \(abundants.count)")
    
    var abundantSumSet:Set<Int> = []
    
    for a in 0..<abundants.count
    {
        print("A: \(a)")
        
        for b in a..<abundants.count
        {
            let abSum = abundants[a] + abundants[b]
            
            if abSum < 28124
            {
                abundantSumSet.insert(abSum)
            }
        }
    }
    
    var sum = 0
    
    var nextNum = 1
    
    let abundantSumArray = Array(abundantSumSet).sorted()
    
    for nextSum in abundantSumArray
    {
        for i in nextNum..<nextSum
        {
            sum += i
        }
        
        nextNum = nextSum + 1
    }
    
    print(sum)
    
}

func IsAbundant(x:Int) -> Bool
{
    return Abundance(x: x) > 0
}

func Abundance(x:Int) -> Int
{
    return SumOfProperDivisors(x: x) - x
}

func SumOfProperDivisors(x:Int) -> Int
{
    var result = 0
    
    let pDivs = ProperDivisors(x: x)
    
    for nextDiv in pDivs
    {
        result += nextDiv
    }
    
    return result
}

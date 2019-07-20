//
//  Project_26.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-17.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project26()
{
    var maxRepeatingLength = 0
    var maxRepeater:[Int] = []
    var maxRepeatingDenom = 0
    
    for i in 2..<1000
    {
        let repeating = RepeatingDecimal(numer: 1, denom: i)
        
        if repeating.count > maxRepeatingLength
        {
            maxRepeatingLength = repeating.count
            maxRepeater = repeating
            maxRepeatingDenom = i
        }
    }
    
    print("n = \(maxRepeatingDenom), digits: \(maxRepeatingLength)")
}

func RepeatingDecimal(numer:Int, denom:Int) -> [Int]
{
    if !IsRepeatingDecimal(numer: numer, denom: denom)
    {
        return []
    }
    
    var result:[Int] = []
    
    var nextNumer = numer % denom
    var usedNumers:[Int] = []
    
    while !usedNumers.contains(nextNumer)
    {
        usedNumers.append(nextNumer)
        
        nextNumer *= 10
        
        result.append(nextNumer / denom)
        
        nextNumer = nextNumer % denom
    }
    
    
    return result
}

func IsRepeatingDecimal(numer:Int, denom:Int) -> Bool
{
    if numer % denom == 0 || numer > denom
    {
        return false
    }
    
    let denomPrimes = PrimeFactors(n: denom)
    
    for nextPrime in denomPrimes
    {
        if nextPrime != 2 && nextPrime != 5
        {
            return true
        }
    }
    
    return false
}

func PrimeFactors(n:Int) -> [Int]
{
    // this returns an array of the prime factors of n, which IS NOT NECESSARILY the same as the Prime Factorization of n
    let factorization = PrimeFactorization(n: n)
    
    let factors = Set(factorization)
    
    return Array(factors)
}

func PrimeFactorization(n:Int) -> [Int]
{
    // does not return one or n
    if n < 3
    {
        return []
    }
    
    var newN = n
    var result:[Int] = []
    
    while newN % 2 == 0
    {
        result.append(2)
        newN /= 2
    }
    
    for i in stride(from: 3, through: Int(floor(sqrt(Double(newN)) + 0.5)), by: 2)
    {
        while newN % i == 0
        {
            result.append(i)
            newN /= i
        }
    }
    
    if newN > 2
    {
        result.append(newN)
    }
    
    return result
}

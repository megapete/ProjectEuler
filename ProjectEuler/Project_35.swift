//
//  Project_35.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-19.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project35()
{
    var circularPrime:Set<Int> = []
    
    let primes = SieveOfEratosthenes(n: 1000000)
    
    for nextPrime in primes
    {
        if circularPrime.contains(nextPrime)
        {
            continue
        }
        
        if nextPrime < 10
        {
            circularPrime.insert(nextPrime)
        }
        else
        {
            let digits = DigitArray(n: nextPrime)
            
            let rotations = Rotations(digits: digits)
            
            var isCircularPrime = true
            
            for nextRot in rotations
            {
                if !IsPrime(n: DigitsAsInt(digits: nextRot))
                {
                    isCircularPrime = false
                    break
                }
            }
            
            if isCircularPrime
            {
                for nextRot in rotations
                {
                    circularPrime.insert(DigitsAsInt(digits: nextRot))
                }
            }
        }
    }
    
    print(Array(circularPrime).sorted())
    print(circularPrime.count)
}

func DigitsAsInt(digits:[Int]) -> Int
{
    let revDigits:[Int] = digits.reversed()
    
    var result = revDigits[0]
    
    var multiplier = 10
    
    for i in 1..<digits.count
    {
        result += revDigits[i] * multiplier
        
        multiplier *= 10
    }
    
    return result
}

func Rotations(digits:[Int]) -> [[Int]]
{
    // The first entry is the parameter (digits)
    var result:[[Int]] = [digits]
    
    var lastRotation = digits
    
    for _ in 1..<digits.count
    {
        let rotationDigit = lastRotation[0]
        for i in 1..<digits.count
        {
            lastRotation[i-1] = lastRotation[i]
        }
        
        lastRotation[digits.count - 1] = rotationDigit
        
        result.append(lastRotation)
    }
    
    return result
}

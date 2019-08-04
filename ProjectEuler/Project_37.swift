//
//  Project_37.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-20.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project37()
{
    var numTruncatables = 0
    var sumTruncatables = 0
    
    let primes = SieveOfEratosthenes(n: 1000000)
    
    for nextPrime in primes
    {
        if IsTruncatablePrime(n: nextPrime)
        {
            print(nextPrime)
            
            numTruncatables += 1
            sumTruncatables += nextPrime
        }
    }
    
    print("Number of truncs: \(numTruncatables): \(sumTruncatables)")
}

func IsTruncatablePrime(n:Int) -> Bool
{
    if n <= 7
    {
        return false
    }
    
    var x = DigitArray(n: n)
    
    for _ in 0..<x.count
    {
        let test = DigitsAsInt(digits: x)
        if !IsPrime(n: DigitsAsInt(digits: x))
        {
            return false
        }
        
        x.removeFirst()
    }
    
    x = DigitArray(n: n)
    
    x.removeLast()
    
    for _ in 0..<x.count
    {
        if !IsPrime(n: DigitsAsInt(digits: x))
        {
            return false
        }
        
        x.removeLast()
    }
    
    return true
}

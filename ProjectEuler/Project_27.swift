//
//  Project_27.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-18.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project27()
{
    var positivePrimes = SieveOfEratosthenes(n: 1000)
    
    var allPrimes:[Int] = []
    
    for i in stride(from: positivePrimes.count - 1, to: 0, by: -1)
    {
        allPrimes.append(positivePrimes[i] * -1)
    }
    
    allPrimes += positivePrimes
    
    var maxA = 0
    var maxB = 0
    var maxConsecutivePrimes = 0
    
    for a in -999..<1000
    {
        // var currentCons = 0
        for b in -1000...1000
        {
            var n = 0
            
            
            while IsPrime(n: n * n + a * n + b)
            {
                n += 1
            }
            
            if n > maxConsecutivePrimes
            {
                maxA = a
                maxB = b
                maxConsecutivePrimes = n
            }
        }
    }
    
    print("a:\(maxA), b:\(maxB), Consecutive Primes: \(maxConsecutivePrimes), a*b = \(maxA * maxB)")
    
}

func IsPrime(n:Int) -> Bool
{
    if n <= 0
    {
        return false
    }
    
    if n < 4
    {
        return true
    }
    
    if n % 2 == 0
    {
        return false
    }
    
    let root = Int(floor(sqrt(Double(n)) + 0.5))
    
    for i in stride(from: 5, through: root, by: 2)
    {
        if n % i == 0
        {
            return false
        }
    }
    
    return true
}

//
//  Project_50.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-07.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project50()
{
    let hilimit = 1000000
    
    let primes = OptimizedSieveOfEratosthenes(n: hilimit)
    
    guard let lastPrime = primes.last else
    {
        print("WTF?")
        return
    }
    
    var result:[Int] = []
    
    for startIndex in 0..<primes.count
    {
        var nextCandidate:[Int] = []
        var currentSum = primes[startIndex]
        
        for i in (startIndex + 1)..<primes.count
        {
            if currentSum + primes[i] > lastPrime
            {
                break
            }
            
            currentSum += primes[i]
            
            if IsPrime(n: currentSum)
            {
                nextCandidate = Array(primes[startIndex...i])
            }
            
        }
        
        if nextCandidate.count > result.count
        {
            result = nextCandidate
        }
    }
    
    print("Sum: \(SumOfArray(x: result))")
}



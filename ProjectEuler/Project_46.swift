//
//  Project_46.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-05.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project46()
{
    let hilimit = 10000
    
    var primes = SieveOfEratosthenes(n: hilimit)
    primes.removeFirst()
    
    let oddComps = SieveOfOddComposites(n: hilimit)
    
    for nextOddComp in oddComps
    {
        var testResult = false
        
        for nextPrime in primes
        {
            if nextPrime > nextOddComp
            {
                break
            }
            
            let nextTestValue = (nextOddComp - nextPrime) / 2
            
            if let root = IntSqrt(x: nextTestValue)
            {
                print("Comp: \(nextOddComp) = \(nextPrime) + 2 * \(root)^2")
                testResult = true
                break
            }
        }
        
        if !testResult
        {
            print("FALSE for \(nextOddComp)")
            break
        }
    }
}

func SieveOfOddComposites(n:Int) -> [Int]
{
    var prime = [Bool](repeating: true, count: n+1)
    
    var p = 2
    
    while p * p <= n
    {
        if (prime[p] == true)
        {
            for i in stride(from: p * p, through: n, by: p)
            {
                prime[i] = false
            }
        }
        
        p += 1
    }
    
    var result:[Int] = []
    
    for i in stride(from: 9, through: n, by: 2)
    {
        if !prime[i]
        {
            result.append(i)
        }
    }
    
    return result
}

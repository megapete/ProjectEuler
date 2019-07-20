//
//  Project_7.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-11.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project7()
{
    let n = 200000

    
    let primes = SieveOfEratosthenes(n: n)
    print(primes.count)
    print(primes[10000])
}

func SieveOfEratosthenes(n:Int) -> [Int]
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
    
    for i in 2...n
    {
        if prime[i]
        {
            result.append(i)
        }
    }
    
    return result
}

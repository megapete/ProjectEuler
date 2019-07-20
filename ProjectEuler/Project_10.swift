//
//  Project_10.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-11.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project10()
{
    let n = 2000000
    
    let primes = SieveOfEratosthenes(n: n)
    
    var sum = 0
    for nextPrime in primes
    {
        sum += nextPrime
    }
    
    print(sum)
}

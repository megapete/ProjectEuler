//
//  Project_51.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-07.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project51()
{
    let lolimit = 10000
    let hilimit = 100000
    let numPrimePermutations = 7
    
    var primes = OptimizedSieveOfEratosthenes(n: hilimit)
    
    while primes.first! < lolimit
    {
        primes.removeFirst()
    }
    
    
    
}

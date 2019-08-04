//
//  Project_43.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-24.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project43()
{
    var sum = 0
    var s = [1,0,2,3,4,5,6,7,8,9]
    let primes = SieveOfEratosthenes(n: 17)
    
    while s.count != 0
    {
        var divisorIndex = 0
        var meetsRequirement = true
        for baseIndex in 1..<8
        {
            let nextGroup = [s[baseIndex], s[baseIndex+1], s[baseIndex+2]]
            
            let chkNum = DigitsAsInt(digits: nextGroup)
            
            let factors = Factorize(n: chkNum)
            
            if !factors.contains(primes[divisorIndex])
            {
                meetsRequirement = false
                break
            }
            
            divisorIndex += 1
        }
        
        if meetsRequirement
        {
            print("Got one: \(s)")
            sum += DigitsAsInt(digits: s)
        }
        
        s = GetNextPermutation(set: s)
    }
    
    print(sum)
}

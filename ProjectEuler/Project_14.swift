//
//  Project_14.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-12.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project14()
{
    var maxElements = 0
    var maxN = 1
    
    for i in 1..<1000000
    {
        let collatz = CollatzSequence(n: i)
        
        if collatz.count > maxElements
        {
            maxElements = collatz.count
            maxN = i
        }
    }
    
    print("\(maxN): \(maxElements) elements")
}

func CollatzSequence(n:Int) -> [Int]
{
    var nextN = n
    
    var result = [n]
    
    repeat {
        
        if nextN % 2 == 0
        {
            nextN /= 2
        }
        else
        {
            nextN = 3 * nextN + 1
        }
        
        result.append(nextN)
        
    } while nextN != 1
    
    return result
}

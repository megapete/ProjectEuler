//
//  Project_39.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-20.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project39()
{
    var maxP = 0
    var maxSolutions = 0
    
    for p in 3..<1000
    {
        var pResult:[[Int]] = []
        
        for a in 1..<(p-2)
        {
            for b in a..<(p-2)
            {
                let c = p - a - b
                
                if a * a + b * b == c * c
                {
                    pResult.append([a, b, c])
                }
            }
        }
        
        if pResult.count > maxSolutions
        {
            maxSolutions = pResult.count
            maxP = p
        }
    }
    
    print("p: \(maxP), count = \(maxSolutions)")
}

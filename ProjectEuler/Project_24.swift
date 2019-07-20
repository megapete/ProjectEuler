//
//  Project_24.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-16.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project24()
{
    var s = [0,1,2,3,4,5,6,7,8,9]
    var permCount = 1
    
    while s.count > 0 && permCount < 1000000
    {
        permCount += 1
        s = GetNextPermutation(set: s)
    }
    
    print(s)
}

func GetNextPermutation(set:[Int]) -> [Int]
{
    var x = set.count - 2
    
    while set[x] > set[x + 1]
    {
        x -= 1
        
        if x < 0
        {
            return []
        }
    }
    
    var y = x + 1
    
    while y < set.count && set[y] > set[x]
    {
        y += 1
    }
    
    y -= 1
    
    var P = set
    
    P[x] = set[y]
    P[y] = set[x]
    
    P[(x+1)...].reverse()
    
    return P
}

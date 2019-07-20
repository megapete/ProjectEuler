//
//  Project_9.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-11.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project9()
{
    for a in 1..<1000
    {
        for b in a+1..<1000
        {
            let c = 1000 - b - a
            
            if (c > b)
            {
                if TestForTriplet(a: a, b: b, c: c)
                {
                    print("\(a), \(b), \(c): \(a * b * c)")
                    return
                }
            }
        }
    }
}

func TestForTriplet(a:Int, b:Int, c:Int) -> Bool
{
    if (a*a + b*b == c*c)
    {
        return true
    }
    
    return false
}

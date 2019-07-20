//
//  Project_3.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-10.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Factorize(val:Int) -> [Int] {
    
    var value = val
    
    var factors:[Int] = []
    
    // take care of even numbers
    while (value % 2 == 0)
    {
        factors.append(2)
        
        value /= 2
    }
    
    let max:Int = Int(sqrt(Double(value)))
    
    for i in stride(from: 3, to: max, by: 2)
    {
        while value % i == 0
        {
            factors.append(i)
            
            value /= i
        }
    }
    
    if value > 2
    {
        factors.append(value)
    }
    
    return factors
}

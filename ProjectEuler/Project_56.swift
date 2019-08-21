//
//  Project_56.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-13.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project56()
{
    var maxSum = 0
    
    for a in 2..<100
    {
        for b in 2..<100
        {
            let number = RepresentPower(base: a, power: b)
            
            let chkSum = Sum(values: number)
            
            if chkSum > maxSum
            {
                maxSum = chkSum
            }
        }
    }
    
    print(maxSum)
    
}

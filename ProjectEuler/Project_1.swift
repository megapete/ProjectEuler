//
//  Project_1.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-13.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project1()
{
    var sum = 0
    
    for i in 1..<1000
    {
        if i % 3 == 0
        {
            sum += i
        }
        else if i % 5 == 0
        {
            sum += i
        }
    }
    
    print(sum)
}

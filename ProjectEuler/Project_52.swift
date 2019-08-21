//
//  Project_52.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-07.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project52()
{
    for i in 140000..<200000
    {
        if IsPermutation(base: i, candidate: 2*i)
        {
            if IsPermutation(base: i, candidate: 3*i)
            {
                if IsPermutation(base: i, candidate: 4*i)
                {
                    if IsPermutation(base: i, candidate: 5*i)
                    {
                        if IsPermutation(base: i, candidate: 6*i)
                        {
                            print("Got one: \(i), \(2*i), \(3*i), \(4*i), \(5*i), \(6*i)")
                        }
                    }
                }
            }
            
        }
    }
}

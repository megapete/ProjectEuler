//
//  Project_45.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-05.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project45()
{
    // see the word document that I created for this project to see why Ti=Hj iff i=2j-1
    
    for j in 1..<100000
    {
        let hexa = HexagonalNumber(n: j)
        if IsPentagonal(Pn: hexa)
        {
            print("Hexagonal: \(hexa), T[\(2*j-1)] = \(TriangleNumber(n: 2*j-1))")
        }
    }
}

func HexagonalNumber(n:Int) -> Int
{
    return n * (2 * n - 1)
}

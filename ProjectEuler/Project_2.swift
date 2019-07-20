//
//  Project_2.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-10.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func DoProject2() {

    var fibbSequence = [1,2]
    var currentIndex = 0
    var nextValue = 3
    var sum = 2
    
    let maxValue = 4000000
    
    while nextValue < maxValue
    {
        if nextValue % 2 == 0
        {
            sum += nextValue
        }
        
        fibbSequence.append(nextValue)
        
        currentIndex += 1
        
        nextValue = fibbSequence[currentIndex] + fibbSequence[currentIndex + 1]
    }
    
    print(sum)
    
}

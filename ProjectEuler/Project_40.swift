//
//  Project_40.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-20.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

// See Excel sheet for Project40 that I created to calculate this with the "tensStarts" array that is calculated in this routine.

import Foundation

func Project40()
{
    var testStr = ""
    for i in 0...10000
    {
        let iString = "\(i)"
        testStr += iString
    }
    
    let tstStIndex = testStr.index(testStr.startIndex, offsetBy: 9998)
    let tstEndIndex = testStr.index(testStr.startIndex, offsetBy: 10001)
    print(testStr[tstStIndex...tstEndIndex])
    
    
    var numCharsPerNumber = 1
    var charCount = 0
    
    var tensStarts:[Int] = [1]
    
    for i in 0..<1000001
    {
        let iString = "\(i)"
        
        if iString.count > numCharsPerNumber
        {
            numCharsPerNumber += 1
            // print("Character count: \(charCount); Switching to \(numCharsPerNumber) chars per number")
            
            tensStarts.append(charCount)
        }
        
        charCount += numCharsPerNumber
    }
    
    print(tensStarts)
    
    let d = 191
    
    var tenIndex = 0
    var tenPower = 1
    
    for nextIndex in tensStarts
    {
        if nextIndex == d
        {
            tenIndex = nextIndex
            break
        }
        else if nextIndex > d
        {
            tenPower /= 10
            break
        }
        
        tenPower *= 10
        tenIndex = nextIndex
    }
    
    let offset = d - tenIndex
    
    numCharsPerNumber = Int(log10(Double(tenPower))) + 1
    
    let numCount = offset / numCharsPerNumber
    
    
    
}


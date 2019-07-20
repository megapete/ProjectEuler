//
//  Project_13.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-11.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project13()
{
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let fileURL = paths[0].appendingPathComponent("Project13.txt")
    
    print(fileURL)
    
    do {
    
        let fileString = try String(contentsOf: fileURL)
        
        let numArray = fileString.components(separatedBy: "\n")
        
        var sum:Double = 0.0
        
        for nextNum in numArray
        {
            sum += Double(nextNum)!
        }
        
        print(sum)
    
    } catch {
        
    }
}

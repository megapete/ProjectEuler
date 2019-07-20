//
//  Project_22.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-16.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project22()
{
    var fileString:String = ""
    
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let fileURL = paths[0].appendingPathComponent("p022_names.txt")
    
    // print(fileURL)
    
    do {
        
        fileString = try String(contentsOf: fileURL)
        
    } catch {
        
        print("Could not open file as String")
    }
    
    fileString = fileString.replacingOccurrences(of: "\"", with: "")
    let nameArray = fileString.components(separatedBy: ",").sorted()
    
    var result = 0
    
    for i in 0..<nameArray.count
    {
        result += (i + 1) * AlphabeticalValue(s: nameArray[i])
    }
    
    print(result)
}

func AlphabeticalValue(s:String) -> Int
{
    var result = 0
    
    let base = Character("A").asciiValue! - 1
    
    var currentIndex = s.startIndex
    
    while currentIndex < s.endIndex
    {
        result += Int(s[currentIndex].asciiValue! - base)
        
        currentIndex = s.index(currentIndex, offsetBy: 1)
    }
    
    return result
}

//
//  Project_42.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-23.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project42()
{
    let fileString = OpenDocumentAsString(fileName: "Project42.txt").replacingOccurrences(of: "\"", with: "")
    
    let wordArray = fileString.components(separatedBy: ",").sorted()
    
    var count = 0
    
    for nextWord in wordArray
    {
        let value = AlphabeticalValue(s: nextWord)
        
        if IsTriangle(n: value)
        {
            count += 1
        }
    }
    
    print(count)
}

func IsTriangle(n:Int) -> Bool
{
    let x = Int(floor(sqrt(Double(2 * n))))
    
    return x * (x + 1) == 2 * n
}

func OpenDocumentAsString(fileName:String) -> String
{
    var fileString:String = ""
    
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let fileURL = paths[0].appendingPathComponent(fileName)
    
    // print(fileURL)
    
    do {
        
        fileString = try String(contentsOf: fileURL)
        
    } catch {
        
        print("Could not open file as String")
    }
    
    return fileString
}

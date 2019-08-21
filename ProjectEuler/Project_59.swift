//
//  Project_59.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-20.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project59()
{
    // Used the FindKey() function below and by debugging the decrypted string every time through, I found that the key is 101, 120, 112 in ASCII, which is "exp"
    
    let encryptedFileString = OpenDocumentAsString(fileName: "p059_cipher.txt")
    
    let encryptedFileArray = encryptedFileString.components(separatedBy: ",")
    
    let key1:UInt8 = 101
    let key2:UInt8 = 120
    let key3:UInt8 = 112
    
    var asciiSum = 0
    
    for i in 0..<encryptedFileArray.count
    {
        var key = key1
        
        if i % 3 == 1
        {
            key = key2
        }
        else if i % 3 == 2
        {
            key = key3
        }
        
        guard let fileChar = UInt8(encryptedFileArray[i]) else
        {
            print("AAAAHHHH")
            break
        }
        
        let unencryptedChar = key ^ fileChar
        
        asciiSum += Int(unencryptedChar)
    }
    
    print(asciiSum)
}

func FindKey()
{
    let encryptedFileString = OpenDocumentAsString(fileName: "p059_cipher.txt")
    
    let encryptedFileArray = encryptedFileString.components(separatedBy: ",")
    
    let ascii_a = Character("a").asciiValue!
    let ascii_z = Character("z").asciiValue!
    
    for key3 in ascii_a...ascii_z
    {
        for key2 in ascii_a...ascii_z
        {
            for key1 in ascii_a...ascii_z
            {
                var unencryptedFileString = ""
                
                var validChars = true
                
                for i in 0..<encryptedFileArray.count
                {
                    var key = key1
                    
                    if i % 3 == 1
                    {
                        key = key2
                    }
                    else if i % 3 == 2
                    {
                        key = key3
                    }
                    
                    guard let fileChar = UInt8(encryptedFileArray[i]) else
                    {
                        print("AAAAHHHH")
                        break
                    }
                    
                    let unencryptedChar = key ^ fileChar
                    
                    if unencryptedChar < 32 || unencryptedChar > ascii_z
                    {
                        validChars = false
                        break
                    }
                    
                    unencryptedFileString += String(UnicodeScalar(unencryptedChar))
                }
                
                if validChars
                {
                    
                    print(unencryptedFileString)
                }
            }
        }
    }
}

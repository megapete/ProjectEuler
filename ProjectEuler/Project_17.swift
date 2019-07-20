//
//  Project_17.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-15.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project17()
{
    var charCount = 0
    
    for i in 1...1000
    {
        charCount += NumAsString(x: i).count
    }
    
    print(charCount)
}

func NumAsString(x:Int) -> String
{
    // only works to 1000
    
    var num = x
    
    if num >= 1000
    {
        return "OneThousand"
    }
    
    var result = ""
    
    if num >= 900
    {
        result += "NineHundred"
    }
    else if num >= 800
    {
        result += "EightHundred"
    }
    else if num >= 700
    {
        result += "SevenHundred"
    }
    else if num >= 600
    {
        result += "SixHundred"
    }
    else if num >= 500
    {
        result += "FiveHundred"
    }
    else if num >= 400
    {
        result += "FourHundred"
    }
    else if num >= 300
    {
        result += "ThreeHundred"
    }
    else if num >= 200
    {
        result += "TwoHundred"
    }
    else if num >= 100
    {
        result += "OneHundred"
    }
    
    if num % 100 == 0
    {
        return result
    }
    
    if num >= 100
    {
        result += "And"
    }
    
    num = num % 100
    
    if num >= 90
    {
        result += "Ninety"
    }
    else if num >= 80
    {
        result += "Eighty"
    }
    else if num >= 70
    {
        result += "Seventy"
    }
    else if num >= 60
    {
        result += "Sixty"
    }
    else if num >= 50
    {
        result += "Fifty"
    }
    else if num >= 40
    {
        result += "Forty"
    }
    else if num >= 30
    {
        result += "Thirty"
    }
    else if num >= 20
    {
        result += "Twenty"
    }
    else if num >= 10
    {
        if num == 10
        {
            result += "Ten"
        }
        else if num == 11
        {
            result += "Eleven"
        }
        else if num == 12
        {
            result += "Twelve"
        }
        else if num == 13
        {
            result += "Thirteen"
        }
        else if num == 14
        {
            result += "Fourteen"
        }
        else if num == 15
        {
            result += "Fifteen"
        }
        else if num == 16
        {
            result += "Sixteen"
        }
        else if num == 17
        {
            result += "Seventeen"
        }
        else if num == 18
        {
            result += "Eighteen"
        }
        else if num == 19
        {
            result += "Nineteen"
        }
        
        return result
    }
    
    num = num % 10
    
    if num == 1
    {
        result += "One"
    }
    else if num == 2
    {
        result += "Two"
    }
    else if num == 3
    {
        result += "Three"
    }
    else if num == 4
    {
        result += "Four"
    }
    else if num == 5
    {
        result += "Five"
    }
    else if num == 6
    {
        result += "Six"
    }
    else if num == 7
    {
        result += "Seven"
    }
    else if num == 8
    {
        result += "Eight"
    }
    else if num == 9
    {
        result += "Nine"
    }
    
    return result
}

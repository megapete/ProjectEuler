//
//  Project_19.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-15.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

// 0=Sunday, 1=Monday, ... 6=Saturday

func Project19()
{
    var sundaySum = 0
    
    for year in 1901...2000
    {
        for mth in 1...12
        {
            if DayFromDate(dateNumber: 1, month: mth, year: year) == 0
            {
                sundaySum += 1
            }
        }
    }
    
    print(sundaySum)
}

func DayFromDate(dateNumber:Int, month:Int, year:Int) -> Int
{
    var theDay = FirstDayOfYear(year: year)
    
    for i in 1..<month
    {
        if i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12
        {
            theDay += 31
        }
        else if i == 2
        {
            if IsLeapYear(year: year)
            {
                theDay += 29
            }
            else
            {
                theDay += 28
            }
        }
        else
        {
            theDay += 30
        }
    }
    
    theDay += dateNumber - 1
    
    return theDay % 7
}

func FirstDayOfYear(year:Int) -> Int
{
    let baseYear = 1900
    var startDay = 1
    
    for i in baseYear..<year
    {
        startDay += (IsLeapYear(year: i) ? 366 : 365)
    }
    
    return startDay % 7
}

func IsLeapYear(year:Int) -> Bool
{
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
}

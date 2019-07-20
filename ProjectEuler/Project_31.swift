//
//  Project_31.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-18.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project31()
{
    let currency = [1,2,5,10,20,50,100,200]
    let money = 200
    
    print(CountCoin(S: currency, m: currency.count, n: money))
}

func CountCoin(S:[Int], m:Int, n:Int) -> Int
{
    if n == 0
    {
        return 1
    }
    
    if n < 0
    {
        return 0
    }
    
    if m <= 0 && n >= 1
    {
        return 0
    }
    
    return CountCoin(S: S, m: m - 1, n: n) + CountCoin(S: S, m: m, n: n - S[m - 1])
}

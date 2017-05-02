//
//  main.swift
//  TestSwift
//
//  Created by Rustam on 23/04/2017.
//  Copyright © 2017 Rustam. All rights reserved.
//

import Foundation

var K = 0, N = 0
var S:[(s:Double, r:Int)] = []

var scanner:Scanner! = nil

func solve(_ tst:Int) {
    scanner = Scanner(string:readLine()!)
    scanner.scanInt(&N)
    scanner.scanInt(&K)
    S = []
    for _ in 0..<N {
        scanner = Scanner(string:readLine()!)
        var r = 0, h = 0
        scanner.scanInt(&r)
        scanner.scanInt(&h)
        let s:Double = 2.0 * Double.pi * Double(r * h)
        S.append((s, r))
    }
    
    S.sort(by: {$0.s > $1.s})
    
    var ans:Double = 0
    for (i, vali) in S.enumerated() {
        var cur:Double = Double.pi * Double(vali.r * vali.r)
        cur += vali.s
        var left = K - 1
        for (j, valj) in S.enumerated() {
            if left == 0 {
                break
            }
            if i == j {
                continue
            }
            if valj.r > vali.r {
                continue
            }
            left = left - 1
            cur += valj.s
        }
        
        ans = max(ans, cur)
    }
    print("Case #\(tst): \(ans)")
    
}

func main() {
    freopen("/Users/ryuzmukhametov/sp/SPActive/input.txt", "r", stdin)
    freopen("/Users/ryuzmukhametov/sp/SPActive/output.txt", "w", stdout)
    let T:Int = Int(readLine()!)!
    for tst in 1...T {
        solve(tst)
    }
}

main()

//
//  main.swift
//  TestSwift
//
//  Created by Rustam on 23/04/2017.
//  Copyright © 2017 Rustam. All rights reserved.
//

import Foundation

var R = 0, C = 0
var S:[[Character]] = []


func rec(_ i0:Int, _ j0:Int, _ w:Int, _ h:Int) {
    
    var i1 = -1, j1 = -1
    var i2 = -1, j2 = -1
    var ch1:Character = "?"
    
    for i in 0..<w {
        for j in 0..<h {
            let ch = S[i0 + i][j0 + j]
            if ch != "?" {
                if i1 == -1 {
                    (i1, j1) = (i + i0, j + j0)
                    ch1 = ch
                } else if i2 == -1 {
                    (i2, j2) = (i + i0, j + j0)
                }
            }
        }
    }
    if i1 == -1 {
        print("assert")
    } else if i2 == -1 {
        for i in 0..<w {
            for j in 0..<h {
                S[i0 + i][j0 + j] = ch1
            }
        }
        
        
    } else {
        if j1 != j2 {
            if j1 > j2 {
                swap(&i1, &i2)
                swap(&j1, &j2)
            }
            rec(i0, j0, w, j1 - j0 + 1)
            rec(i0, j1 + 1, w, h - (j1 - j0 + 1))
            
        } else {
            if i1 > i2 {
                swap(&i1, &i2)
                swap(&j1, &j2)
            }
            rec(i0, j0, i1 - i0 + 1, h)
            rec(i1 + 1, j0, w - (i1 - i0 + 1), h)
        }
    }
    
    
    
}


func solve(_ tst:Int) {
    let scanner = Scanner(string:readLine()!)
    
    scanner.scanInt(&R)
    scanner.scanInt(&C)
    
    S = []
    
    for _ in 0..<R {
        let s = readLine()!
        let cur:[Character] = [Character](s.characters)
        S.append(cur)
    }
    
    rec(0, 0, R, C)
    print("Case #\(tst):")
    for i in 0..<R {
        for j in 0..<C {
            print(S[i][j], terminator:"")
        }
        print("")
    }
    
    
}

func main() {
    freopen("/Users/ryuzmukhametov/sp/SPActive/input.txt", "r", stdin)
    //freopen("/Users/ryuzmukhametov/sp/SPActive/output.txt", "w", stdout)
    let T:Int = Int(readLine()!)!
    for tst in 1...T {
        solve(tst)
    }
}

main()

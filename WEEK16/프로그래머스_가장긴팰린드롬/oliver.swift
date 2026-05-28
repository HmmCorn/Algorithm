import Foundation

func solution(_ s: String) -> Int {

    let n = s.count
    if n <= 1 { return n }
    let chars = Array(s)

    var result = 1

    var dp = Array(repeating: Array(repeating: false, count: n), count: n)
    for i in 0..<n {
        dp[i][i] = true
    }
    for i in 0..<n-1 {
        if chars[i] == chars[i+1] {
            dp[i][i+1] = true
            result = 2
        }
    }

    if n >= 3 {
        for len in 3...n {
            for i in 0...(n - len) {
                let j = i + len - 1

                if chars[i] == chars[j] && dp[i + 1][j - 1] {
                    dp[i][j] = true
                    result = max(result, len)
                }
            }
        }
    }

    return result
}


// 임의의 문자열이 팰린드롬이면,
// 양 끝 글자가 같고,
// 안쪽 문자열도 팰린드롬이다.

/*
점화식
dp[i][j] = (s[i] == s[j]) && dp[i+1][j-1]


"abcdcba"

       0(a)  1(b)  2(c)  3(d)  4(c)  5(b)  6(a)
0(a) [  T  ,  F  ,  F  ,  F  ,  F  ,  F  ,  T  ]
1(b) [     ,  T  ,  F  ,  F  ,  F  ,  T  ,  F  ]
2(c) [     ,     ,  T  ,  F  ,  T  ,  F  ,  F  ]
3(d) [     ,     ,     ,  T  ,  F  ,  F  ,  F  ]
4(c) [     ,     ,     ,     ,  T  ,  F  ,  F  ]
5(b) [     ,     ,     ,     ,     ,  T  ,  F  ]
6(a) [     ,     ,     ,     ,     ,     ,  T  ]


*/

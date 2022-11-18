//
//  main.swift
//  MyCreditManager
//
//  Created by 김민택 on 2022/11/18.
//

import Foundation

while true {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가 (변경), 4: 성적삭제, 5: 평점보기, X: 종료")

    combiningFunction(input: readLine()!)
}

func combiningFunction(input: String) {
    switch input {
    case "1":
        print("학생추가")
    case "2":
        print("학생삭제")
    case "3":
        print("성적추가 (변경)")
    case "4":
        print("성적삭제")
    case "5":
        print("평점보기")
    case "X":
        print("종료")
    default:
        wrongInput()
    }
}

func wrongInput() {
}

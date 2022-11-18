//
//  main.swift
//  MyCreditManager
//
//  Created by 김민택 on 2022/11/18.
//

import Foundation

var students: [String: [String: String]] = [:]

while true {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가 (변경), 4: 성적삭제, 5: 평점보기, X: 종료")

    combiningFunction(input: readLine()!)
}

func combiningFunction(input: String) {
    switch input {
    case "1":
        addStudent()
    case "2":
        removeStudent()
    case "3":
        updateScore()
    case "4":
        deleteScore()
    case "5":
        showAverage()
    case "X":
        exit()
    default:
        wrongInput()
    }
}

func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")

    let name = readLine()!

    if name == "" {
        wrongInput()
    } else if students[name] != nil {
        print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else {
        students[name] = [:]
        print("\(name) 학생을 추가했습니다.")
    }
}

func removeStudent() {
    print("삭제할 학생의 이름을 입력해주세요")

    let name = readLine()!

    if students[name] != nil {
        students[name] = nil
        print("\(name) 학생을 삭제하였습니다.")
    } else {
        print("\(name) 학생을 찾지 못했습니다.")
    }
}

func updateScore() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey Swift A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")

    let input = readLine()!.split(separator: " ").map { String($0) }

    if input.count != 3 {
        print("입력이 잘못되엇습니다. 다시 확인해주세요.")
    } else if students[input[0]] != nil {
        students[input[0]]?[input[1]] = input[2]
        print("\(input[0]) 학생의 \(input[1]) 과목이 \(input[2])로 추가(변경)되었습니다.")
    } else {
        print("\(input[0]) 학생의 \(input[1]) 과목이 \(input[2])로 추가(변경)되었습니다.")
    }
}

func deleteScore() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey swift")
    
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    if input.count != 2 {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else if students[input[0]] != nil {
        students[input[0]]?[input[1]] = nil
        print("\(input[0]) 학생의 \(input[1]) 과목의 성적이 삭제되었습니다.")
    } else {
        print("\(input[0]) 학생을 찾지 못했습니다.")
    }
}

func showAverage() {
    print("평점을 알고 싶은 학생의 이름을 입력해주세요")
    
    let input = readLine()!
    
    if input == "" {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else if students[input] != nil {
        var sum = 0.0
        
        students[input]?.forEach {
            print("\($0.key): \($0.value)")
            
            sum += convertScore(score: $0.value)
        }
        
        var average = sum / Double(students[input]!.count)
        print("평점 : \(average)")
    } else {
        print("\(input) 학생을 찾지 못했습니다.")
    }
}

func convertScore(score: String) -> Double {
    switch score {
    case "A+":
        return 4.5
    case "A":
        return 4
    case "B+":
        return 3.5
    case "B":
        return 3
    case "C+":
        return 2.5
    case "C":
        return 2
    case "D+":
        return 1.5
    case "D":
        return 1
    case "F":
        return 0
    default:
        return 0
    }
}

func exit() {
    print("프로그램을 종료합니다...")
    exit(0)
}

func wrongInput() {
    print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
}

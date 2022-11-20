//
//  CreditManager.swift
//  MyCreditManager
//
//  Created by 김민택 on 2022/11/20.
//

import Foundation

class CreditManager {
    var students: [String: [String: String]] = [:]

    func run() {
        while true {
            selectMenu()
        }
    }

    private func selectMenu() {
        print(Sentence.run)

        let input = readLine()!

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
            quit()
        default:
            wrongInput()
        }
    }

    private func addStudent() {
        print(Sentence.addStudent)

        let name = readLine()!

        if name == "" {
            print(Sentence.wrongInput)
        } else if students[name] != nil {
            print(Sentence.studentExist(name: name))
        } else {
            students[name] = [:]
            print(Sentence.studentAdditionSuccess(name: name))
        }
    }

    private func removeStudent() {
        print(Sentence.removeStudent)

        let name = readLine()!

        if students[name] != nil {
            students[name] = nil
            print(Sentence.studentDeletionSuccess(name: name))
        } else {
            print(Sentence.studentNotFound(name: name))
        }
    }

    private func updateScore() {
        print(Sentence.updateScore)

        let input = readLine()!.split(separator: " ").map { String($0) }

        if input.count != 3 {
            print(Sentence.wrongInput)
        } else if students[input[0]] != nil {
            students[input[0]]?[input[1]] = input[2]
            print(Sentence.updateScoreSuccess(input: input))
        } else {
            print(Sentence.studentNotFound(name: input[0]))
        }
    }

    private func deleteScore() {
        print(Sentence.deleteScore)

        let input = readLine()!.split(separator: " ").map { String($0) }

        if input.count != 2 {
            print(Sentence.wrongInput)
        } else if students[input[0]] != nil {
            students[input[0]]?[input[1]] = nil
            print(Sentence.deleteScoreSuccess(input: input))
        } else {
            print(Sentence.studentNotFound(name: input[0]))
        }
    }

    private func showAverage() {
        print(Sentence.showAverage)

        let input = readLine()!

        if input == "" {
            print(Sentence.wrongInput)
        } else if students[input] != nil {
            var sum = 0.0
    
            students[input]?.forEach {
                print(Sentence.showScore(input: $0))

                sum += convertScore(score: $0.value)
            }

            let average = sum / Double(students[input]!.count)
            print(Sentence.showAverageSuccess(average: average))
        } else {
            print(Sentence.studentNotFound(name: input))
        }
    }

    private func convertScore(score: String) -> Double {
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

    private func quit() {
        print(Sentence.quit)
        exit(0)
    }

    private func wrongInput() {
        print(Sentence.wrongInputForMenu)
    }
}

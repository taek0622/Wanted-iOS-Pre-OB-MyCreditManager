//
//  Sentence.swift
//  MyCreditManager
//
//  Created by 김민택 on 2022/11/20.
//

import Foundation

enum Sentence {
    static let run = """
                    원하는 기능을 입력해주세요
                    1: 학생추가, 2: 학생삭제, 3: 성적추가 (변경), 4: 성적삭제, 5: 평점보기, X: 종료
                    """
    static let addStudent = "추가할 학생의 이름을 입력해주세요"
    static let removeStudent = "삭제할 학생의 이름을 입력해주세요"
    static let updateScore = """
                            성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
                            입력예) Mickey Swift A+
                            만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
                            """
    static let deleteScore = """
                            성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
                            입력예) Mickey swift
                            """
    static let showAverage = "평점을 알고 싶은 학생의 이름을 입력해주세요"
    static let quit = "프로그램을 종료합니다..."
    static let wrongInput = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."

    static func studentExist(name: String) -> String {
        return "\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다."
    }
    static func studentAdditionSuccess(name: String) -> String {
        return "\(name) 학생을 추가했습니다."
    }

    static func studentDeletionSuccess(name: String) -> String {
        return "\(name) 학생을 삭제하였습니다."
    }
    static func studentNotFound(name: String) -> String {
        return "\(name) 학생을 찾지 못했습니다."
    }
    
    static let wrongInputForScore = "입력이 잘못되었습니다. 다시 확인해주세요."

    static func updateScoreSuccess(input: [String]) -> String {
        return "\(input[0]) 학생의 \(input[1]) 과목이 \(input[2])로 추가(변경)되었습니다."
    }

    static func deleteScoreSuccess(input: [String]) -> String {
        return "\(input[0]) 학생의 \(input[1]) 과목의 성적이 삭제되었습니다."
    }

    static func showScore(input: (String, String)) -> String {
        return "\(input.0): \(input.1)"
    }

    static func showAverageSuccess(average: Double) -> String {
        return "평점: \(average)"
    }
}

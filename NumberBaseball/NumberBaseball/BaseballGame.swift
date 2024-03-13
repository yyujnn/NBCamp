//
//  BaseballGame.swift
//  NumberBaseball
//
/*
 Lv1
 - 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
 - 정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
 */
import Foundation

class BaseballGame {
    var answer: Int?
    
    func start() {
        guard let generatedAnswer = makeAnswer() else {
            print("Error: 정답이 생성되지 않았습니다.")
            return
        }
        answer = generatedAnswer
        
        // 임의의 수
        let testNumber1 = 123
        let testNumber2 = 456
        let testNumber3 = 789

        checkGuess(testNumber1)
        checkGuess(testNumber2)
        checkGuess(testNumber3)
    }
        
    // MARK: - 정답 만드는 함수
    func makeAnswer() -> Int? {
        var tempNumbers: [Int] = [] // 조건에 맞는 숫자 배열들
        for i in 123...987 {
            let numberString = String(i)
           
            // 중복된 숫자가 없고 0이 포함되어 있지 않은지 확인
            let numberSet = Set(numberString)
            if numberSet.count == 3 && !numberSet.contains("0") {
            // print("Random three-digit number: \(i)")
                tempNumbers.append(i)
            }
        }
        guard let randomNumber = tempNumbers.randomElement() else { return nil }
        return randomNumber
    }
    // MARK: - 추측한 숫자와 정답 비교
    func checkGuess(_ test: Int) {
        guard let answer = answer else {
            print("Error: 정답이 생성되지 않았습니다.")
            return
        }
        print("💡정답: \(answer)")
        print("📩입력값: \(test)")
        if test == answer {
            print("정답입니다!🥳")
        } else {
            print("틀렸습니다..😢")
        }
    }
}

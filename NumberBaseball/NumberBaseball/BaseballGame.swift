//
//  BaseballGame.swift
//  NumberBaseball
//
/*
 Lv2
 - 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다.
 - 같은 자리에 같은 숫자가 있는 경우 스트라이크, 다른 자리에 숫자가 있는 경우 볼입니다.
 - 만약 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요.
 */
import Foundation

class BaseballGame {
    var answer: Int?
    let numberCount = 3
    
    func start() {
        guard let generatedAnswer = makeAnswer() else {
            print("Error: 정답이 생성되지 않았습니다.")
            return
        }
        answer = generatedAnswer
        
        print("⛳️⚾️ 게임을 시작합니다 ⚾️⛳️ \n- - - - - - - - - - - -")
        print("☑️정답: \(answer!)") // 확인용
        
        while true {
            // 1. 유저에게 입력값을 받음
            print("\n숫자를 입력하세요.")
            guard let userInput = readLine() else { continue }
            
            // 2. 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
            guard let userInput = Int(userInput) else {
                print("⚠️ 올바르지 않은 입력값입니다.")
                continue
            }
            
            // 3. 세자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우 반복문 처음으로 돌아가기
            let inputCheck = Array(String(userInput))
            if Set(inputCheck).count != numberCount || inputCheck.contains("0") {
                print("⚠️ 올바르지 않은 입력값입니다.")
                continue
            }
            
            // 4. 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
            // 만약 정답이라면 break 호출하여 반복문 탈출
            var strike = 0
            var ball = 0
            
            let answerNumbers = Array(String(answer!))
            let userInputNumbers = Array(String(userInput))
            
            for (index, number) in userInputNumbers.enumerated() {
                // 입력한 숫자 배열 순회
                // print(index, number)
                if answerNumbers[index] == number {
                    strike += 1
                } else if answerNumbers.contains(number) {
                    ball += 1
                }
            }
           
            if strike == numberCount {
                print("정답입니다!🥳🥳\n게임을 종료합니다.")
                break
            } else if strike == 0 && ball == 0 {
                print("Nothing")
            }
            else {
                print("\(strike) strike \(ball) ball")
            }
        }
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
}

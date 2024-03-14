//
//  GameManager.swift
//  NumberBaseball
//
import Foundation

// MARK: - 게임 실행 관리하는 클래스
class GameManager {
    let numberCount = 3
    func playGame(_ answer: Int) -> Int {
        var trialCount = 0
        while true {
            print("\n숫자를 입력하세요.")
            guard let userInput = readLine() else { continue }
            trialCount += 1
            
            // 2. 문자열 길이 3자리 확인 -> ex) 0456 정수 변환 시 3자리 숫자로 변경
            if userInput.count != numberCount {
                print("⚠️ 올바르지 않은 입력값입니다.")
                continue
            }
            
            // 3. 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
            guard let userInput = Int(userInput) else {
                print("⚠️ 올바르지 않은 입력값입니다.")
                continue
            }
            
            // 4. 세자리가 아니거나, 0으로 시작되거나 특정 숫자가 두번 사용된 경우 반복문 처음으로 돌아가기
            let inputCheck = Array(String(userInput))
            if Set(inputCheck).count != numberCount || inputCheck[0] == "0" || inputCheck.count != numberCount {
                print("⚠️ 올바르지 않은 입력값입니다.")
                continue
            }
            
            // 5. 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
            // 만약 정답이라면 break 호출하여 반복문 탈출
            var strike = 0
            var ball = 0
            
            let answerNumbers = Array(String(answer))
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
                print("정답입니다!🥳🥳\n게임을 종료합니다.\n")
                break
            } else if strike == 0 && ball == 0 {
                print("Nothing")
            }
            else {
                print("\(strike) strike \(ball) ball")
            }
        }
        return trialCount
    }
}

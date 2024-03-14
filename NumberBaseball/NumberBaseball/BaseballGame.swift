//
//  BaseballGame.swift
//  NumberBaseball
//
/*
 Lv4
 - 프로그램을 시작할 때 안내 문구를 보여주세요.
 - 1번 게임 시작하기의 경우 “필수 구현 기능” 의 예시처럼 게임이 진행됩니다
 - 정답을 맞혀 게임이 종료된 경우 위 안내문구를 다시 보여주세요.
 */
import Foundation

class BaseballGame {
    var answer: Int?
    let numberCount = 3
    var isGameRun = true
    
    func start() {
        guard let generatedAnswer = makeAnswer() else {
            print("Error: 정답이 생성되지 않았습니다.")
            return
        }
        answer = generatedAnswer
        print("☑️정답: \(answer!)") // 확인용
        
        
        while isGameRun {
            // 1. 안내문구 출력
            print("""
            ⛳️⚾️ 게임을 시작합니다 ⚾️⛳️
            - - - - - - - - - - - -
            환영합니다!🤗 원하시는 번호를 입력해주세요.
            1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
            """)
            
            // 2. 유저의 입력값을 받음
            guard let inputMene = readLine() else { continue }
            
            // 3. 입력값에 따라 처리(switch - case 활용해보기)
            switch inputMene {
            case "1":
                print("🏁 게임을 시작합니다")
                playGame()
            case "2":
                print("2 선택")
                // 2을 입력한 케이스 작성
                showGameRecords()
            case "3":
                // 루프 종료
                isGameRun = false
            default:
                print("다시 입력해주세요.")
            }
            
        }
    }
    // MARK: - 게임 실행하는 함수
    func playGame() {
        while true {
            print("\n숫자를 입력하세요.")
            guard let userInput = readLine() else { continue }
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
                print("정답입니다!🥳🥳\n게임을 종료합니다.\n")
                break
            } else if strike == 0 && ball == 0 {
                print("Nothing")
            }
            else {
                print("\(strike) strike \(ball) ball")
            }
        }
    }
    
    // MARK: - 게임 기록 보여주는 함수
    func showGameRecords() {
        // 게임 기록을 보여주는 코드 작성
    }
        
    // MARK: - 정답 만드는 함수
    func makeAnswer() -> Int? {
        var tempNumbers: [Int] = [] // 조건에 맞는 숫자 배열들
        for i in 102...987 {
            let numberString = String(i)
           
            // 정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자 (0시작x)
            let numberSet = Set(numberString)
            if numberSet.count == 3 {
            // print("Random three-digit number: \(i)")
                tempNumbers.append(i)
            }
        }
        guard let randomNumber = tempNumbers.randomElement() else { return nil }
        return randomNumber
    }
}

//
//  BaseballGame.swift
//  NumberBaseball
//
/*
 Lv5
 - 프로그램을 시작할 때 안내 문구를 보여주세요.
 - 1번 게임 시작하기의 경우 “필수 구현 기능” 의 예시처럼 게임이 진행됩니다
 - 정답을 맞혀 게임이 종료된 경우 위 안내문구를 다시 보여주세요.
 - 2번 게임 기록 보기의 경우 완료한 게임들에 대해 시도 횟수를 보여줍니다
 */
import Foundation

class BaseballGame {
    var answer: Int?
    var isGameRun = true
    let gameManager = GameManager() // 게임을 관리하는 인스턴스 생성
    let recordManager = RecordManager() // 기록을 관리하는 인스턴스 생성
    
    func start() {
        while isGameRun {
            // 정답 생성
            guard let generatedAnswer = makeAnswer() else {
                print("Error: 정답이 생성되지 않았습니다.")
                return
            }
            answer = generatedAnswer
            print("☑️정답: \(answer!)") // 확인용
            
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
                recordManager.add(gameManager.playGame(answer!))
            case "2":
                print("📋 게임 기록 보기")
                recordManager.showRecords()
            case "3":
                // 루프 종료
                isGameRun = false
            default:
                print("다시 입력해주세요.")
            }
        }
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

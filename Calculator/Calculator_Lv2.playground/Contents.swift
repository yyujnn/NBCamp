import UIKit

// MARK: - Swift 문법 기초 과제 - 계산기 Lv2
/*
 Lv1에서 만든 Calculator 클래스에 “나머지 연산”이 가능하도록 코드를 추가하고, 연산 진행 후 출력
 +, -, ÷, x
 */

enum Operator {
    case addition
    case subtraction
    case division
    case multiplication
    case remainder

}

/*
class Calculator {
    func calculate(_ operatorCode: Operator, _ firstNumber: Double, _ secondNumber: Double) -> Double {
        return operatorCode.calculate(firstNumber, secondNumber)
    }
}
 */
class Calculator {
    func calculate(_ operatorCode: Operator, _ firstNumber: Double, _ secondNumber: Double) -> Double {
        switch operatorCode {
        case .addition:
            return firstNumber + secondNumber
        case .subtraction:
            return firstNumber - secondNumber
        case .division:
            return firstNumber / secondNumber
        case .multiplication:
            return firstNumber * secondNumber
        case .remainder:
            // return firstNumber - (secondNumber * Double(Int(firstNumber / secondNumber)))
            return firstNumber.truncatingRemainder(dividingBy: secondNumber)
            // truncatingRemainder 메서드 : 두 수를 나눈 후 남는 나머지 반환
        }
    }
}

func testLv2() {
    let calculator = Calculator()
    let addResult = calculator.calculate(.addition, 3, 5)
    let subtractResult = calculator.calculate(.subtraction, 3, 5)
    let multiplyResult = calculator.calculate(.multiplication, 3, 5)
    let divideResult = calculator.calculate(.division, 3, 5)
    let remainderResult = calculator.calculate(.remainder, 3, 5)
    
    print("addResult : \(addResult)")
    print("subtractResult : \(subtractResult)")
    print("multiplyResult : \(multiplyResult)")
    print("divideResult : \(divideResult)")
    print("remainderResult : \(remainderResult)")
}
testLv2()

/*
 고민할 부분
 - enum을 쓰는 게 효율적인가 -> 무조건 enum안의 연산자를 입력해야 오류 없음
 - 정확한 operator 전달되지 않을 시 0을 리턴하는 기능 x(or nil반환)
 - caculate 함수의 역할이 너무 많지 않은지
 */

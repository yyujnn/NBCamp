import UIKit

// MARK: - Swift 문법 기초 과제 - 계산기 Lv1
/*
 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스
 생성한 클래스를 이용하여 연산을 진행하고 출력
 +, -, ÷, x
 */

class Calculator {
    func calculate(_ operateor: Character,_ firstNumber: Double,_ secondNumber: Double) -> Double {
        switch operateor {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "÷":
            return firstNumber / secondNumber
        case "x":
            return firstNumber * secondNumber
        default:
            return 0
        }
    }
}

func testLv1() {
    let calculator = Calculator()
    let addResult = calculator.calculate("+", 3, 5)
    let subtractResult = calculator.calculate("-", 3, 5)
    let multiplyResult = calculator.calculate("x", 3, 5)
    let divideResult = calculator.calculate("÷", 3, 5)
    
    print("addResult : \(addResult)")
    print("subtractResult : \(subtractResult)")
    print("divideResult : \(divideResult)")
    print("multiplyResult : \(multiplyResult)")
}

testLv1()

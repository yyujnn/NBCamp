import UIKit

// MARK: - Swift 문법 기초 과제 - 계산기 Lv3
/*
 아래 각각의 클래스들을 만들고 클래스간의 관계를 고려하여 Calculator 클래스와 관계 맺기
 - AddOperation(더하기)
 - SubstractOperation(빼기)
 - MultiplyOperation(곱하기)
 - DivideOperation(나누기)
 
 Calculator 클래스의 내부코드를 변경
 - 관계를 맺은 후 필요하다면 별도로 만든 연산 클래스의 인스턴스를 Calculator 내부에서 사용
 
 Lv2 와 비교하여 어떠한 점이 개선 되었는지 스스로 생각해 봅니다.
 - hint. 클래스의 책임(단일책임원칙)
 */

// MARK: - class

class Calculator {
    // 프로퍼티 초기화
    let addOperation = AddOperation()
    let subtractOperation = SubstractOperation()
    let multiplyOperation = MultiplyOperation()
    let divideOperation = DivideOperation()
    
    enum Operation {
        case addition
        case subtraction
        case multiplication
        case division
    }
    // -> 배열로 묶을지, enum으로 관리할지 고민!
    
    func calculate(_ operateCode: Operation, _ firstNumber: Double, _ secondNumber: Double) -> Double {
        // opertatorCode에 따라 프로퍼티의 함수를 실행
        switch operateCode {
        case .addition:
            return addOperation.operate(firstNumber, secondNumber)
        case .subtraction:
            return subtractOperation.operate(firstNumber, secondNumber)
        case .multiplication:
            return multiplyOperation.operate(firstNumber, secondNumber)
        case .division:
            return divideOperation.operate(firstNumber, secondNumber)
        }
    }
}

class AddOperation {
    func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

class SubstractOperation {
    func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}
class MultiplyOperation {
    func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}
class DivideOperation {
    func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}

// MARK: - Main
func testLv3() {
    let calculator = Calculator()
    let addResult = calculator.calculate(.addition, 3, 5)
    let subtractResult = calculator.calculate(.subtraction, 3, 5)
    let multiplyResult = calculator.calculate(.multiplication, 3, 5)
    let divideResult = calculator.calculate(.division, 3, 5)
    
    print("addResult : \(addResult)")
    print("subtractResult : \(subtractResult)")
    print("multiplyResult : \(multiplyResult)")
    print("divideResult : \(divideResult)")
}

testLv3()


import UIKit

// MARK: - Swift 문법 기초 과제 - 계산기 Lv4
// 힌트 : 추상화

/*
 AbstractOperation라는 추상화된 클래스를 만들기
 기존에 구현한 AddOperation(더하기), SubtractOperation(빼기), MultiplyOperation(곱하기), DivideOperation(나누기) 클래스들과 관계를 맺고 Calculator 클래스의 내부 코드를 변경
 
 스위프트의 어떤 문법을 이용하여 추상화할 수 있을지 생각해 봅시다
 
 Lv3 와 비교해서 어떠한 점이 개선 되었는지 스스로 생각해 봅니다.
 - hint. 클래스간의 결합도, 의존성(의존성역전원칙)
 */

class Calculator {
    // 하나의 프로퍼티를 갖도록 초기화
    var operation: AbstractOperation?
    // 옵셔널 타입이기 때문에 자동으로 nil로 초기화
    
    // 프로퍼티의 값을 변경하는 함수 구현
    func setOperation(_ operation: AbstractOperation) {
        self.operation = operation
    }
    
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double? {
        guard let operation = operation else {
            return nil
        }
        return operation.calculate(firstNumber, secondNumber)
    }
}

// 프로토콜을 배우지 않아 클래스의 상속으로 처리
class AbstractOperation {
    // 연산을 수행하는 함수 작성
    func calculate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return 0
    }
}
class AddOperation: AbstractOperation {
    // 함수 override
    override func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}
class SubtractOperation: AbstractOperation {
    // 함수 override
    override func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}
class MultiplyOperation: AbstractOperation {
    // 함수 override
    override func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}
class DivideOperation: AbstractOperation {
    // 함수 override
    override func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}


func testLv4() {
    let calculator = Calculator() // (덧셈 기능하도록 초기화)
    
    calculator.setOperation(AddOperation())
    let addResult = calculator.calculate(3, 5)
    
    // calculator에 뺄셈 기능하도록 프로퍼티 변경함수 호출
    calculator.setOperation(SubtractOperation())
    let subtractResult = calculator.calculate(3, 5) // 뺄셈 연산
    print("subtractResult : \(subtractResult)")
    
    // calculator에 곱셈 기능하도록 프로퍼티 변경함수 호출
    calculator.setOperation(MultiplyOperation())
    let multiplyResult = calculator.calculate(3, 5) // 곱셈 연산
    print("multiplyResult : \(multiplyResult)")
    // calculator에 나눗셈 기능하도록 프로퍼티 변경함수 호출
    calculator.setOperation(DivideOperation())
    let divideResult = calculator.calculate(3, 5) // 나눗셈 연산
    print("divideResult : \(divideResult)")

    print("addResult : \(addResult)")
    print("subtractResult : \(subtractResult)")
    print("multiplyResult : \(multiplyResult)")
    print("divideResult : \(divideResult)")
    
}
    
testLv4()
    

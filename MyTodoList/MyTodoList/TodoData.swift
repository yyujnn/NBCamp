//
//  TodoData.swift
//  MyTodoList
//

import Foundation

// MARK: - Todo 데이터 구성
struct TodoData {
    static var nextId = 0
    var id: Int
    var title: String
    var isCompleted: Bool
    // 기타 추가 구현 데이터
    
    init(title: String, isCompleted: Bool = false) {
        self.id = TodoData.nextId
        self.title = title
        self.isCompleted = isCompleted
        TodoData.nextId += 1
    }
}

extension TodoData {
    static let sampleData: [TodoData] = [
        TodoData(title: "메모 과제 Lv1", isCompleted: true),
        TodoData(title: "메모 과제 Lv2", isCompleted: false),
        TodoData(title: "메모 과제 Label 길게 테스트 해보기", isCompleted: false)]
}

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
    
    init(title: String, isCompleted: Bool = false) {
        self.id = TodoData.nextId
        self.title = title
        self.isCompleted = isCompleted
        TodoData.nextId += 1
    }
}

struct Category {
    let name: String
    var todos: [TodoData]
}

extension Category {
    static let sampleData: [Category] = [
        Category(name: "To do List", todos: []),
        Category(name: "Work", todos: []),
        Category(name: "Shopping", todos: [])
    ]
}

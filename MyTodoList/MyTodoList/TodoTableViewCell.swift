//
//  TodoTableViewCell.swift
//  MyTodoList
//
//  Created by 정유진 on 2024/03/22.
//

import UIKit

// MARK: - Todo 데이터 구성
struct TodoDataModel {
    var id: Int
    var title: String
    var isCompleted: Bool
    // 기타 추가 구현 데이터
}

extension TodoDataModel {
    static let sampleData: [TodoDataModel] = [
        TodoDataModel(id: 1, title: "메모 과제 Lv1", isCompleted: true),
        TodoDataModel(id: 2, title: "메모 과제 Lv2", isCompleted: false),
        TodoDataModel(id: 3, title: "메모 과제 Label 길게 테스트 해보기", isCompleted: false)]
}

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var isCompletedSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ todoData: TodoDataModel) {
        todoLabel.text = todoData.title
        isCompletedSwitch.isOn = todoData.isCompleted
    }
    
}

//
//  TodoTableViewCell.swift
//  MyTodoList
//
//  Created by 정유진 on 2024/03/22.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var isCompletedSwitch: UISwitch!
    
    var todoData: TodoData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isCompletedSwitch.isOn = false
        todoLabel.attributedText = nil
    }

    func setData(_ todoData: TodoData) {
        todoLabel.text = todoData.title
        isCompletedSwitch.isOn = todoData.isCompleted
        // 스위치의 상태에 따라 텍스트 라벨의 스타일 변경
        updateLabelStyle()
    }
    
    func updateLabelStyle() {
        if isCompletedSwitch.isOn {
            todoLabel.attributedText = todoLabel.text?.strikeThrough()
        } else {
            todoLabel.attributedText = todoLabel.text?.removeStrikeThrough()
        }
    }
    
}

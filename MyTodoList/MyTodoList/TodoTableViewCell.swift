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
    
    @IBAction func switchChanged(_ sender: Any) {
        if isCompletedSwitch.isOn {
            todoLabel.attributedText = todoLabel.text?.strikeThrough()
        } else {
            todoLabel.attributedText = todoLabel.text?.removeStrikeThrough()
        }
    }
    
    func setData(_ todoData: TodoData) {
        todoLabel.text = todoData.title
        isCompletedSwitch.isOn = todoData.isCompleted
    }
    
}

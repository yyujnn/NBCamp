//
//  ListTableViewCell.swift
//  MyTodoList
//
//  Created by 정유진 on 2024/03/27.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var listLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // listView의 모서리를 둥글게 설정하여 원 모양
        listView.layer.cornerRadius = listView.frame.size.width / 2
        listView.clipsToBounds = true 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

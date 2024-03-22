//
//  TodoTableViewController.swift
//  MyTodoList
//
//  Created by 정유진 on 2024/03/22.
//

import UIKit

class TodoTableViewController: UIViewController {
    
    var todoDatas = TodoDataModel.sampleData
    
    @IBOutlet weak var todoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.allowsSelection = false
        todoTableView.rowHeight = 50
    }
}

// MARK: - Table view data source
extension TodoTableViewController: UITableViewDataSource {
    // 한 section에 몇개의 row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        
        cell.setData(todoDatas[indexPath.row])
        cell.todoLabel.sizeToFit()
        return cell
    }
}

// delegate 역할
extension TodoTableViewController: UITableViewDelegate {
}

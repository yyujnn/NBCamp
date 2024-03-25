//
//  TodoTableViewController.swift
//  MyTodoList
//
//  Created by 정유진 on 2024/03/22.
//

import UIKit

class TodoTableViewController: UIViewController {

    var todoData = [TodoData]()
    var testData = TodoData.sampleData

    @IBOutlet weak var todoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.allowsSelection = false
        todoTableView.rowHeight = 50

    }
    // add 버튼 액션 메서드
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "할 일 추가", message: "할 일을 입력해주세요", preferredStyle: .alert)
        // 버튼 객체
        alert.addTextField { (myTextField) in
            myTextField.placeholder = "todo"
        }
        let registerButton = UIAlertAction(title: "등록", style: .default) { (_) in
            // 등록 코드 작성
            guard let title = alert.textFields?[0].text else { return }
            let todo = TodoData(title: title)
            self.todoData.append(todo)
            self.todoTableView.reloadData()
            
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(registerButton)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Table view data source
extension TodoTableViewController: UITableViewDataSource {
    // 한 section에 몇개의 row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        let todo = todoData[indexPath.row]
        cell.setData(todo)
        cell.todoLabel.sizeToFit()
    
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.todoData.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

// delegate 역할
extension TodoTableViewController: UITableViewDelegate {
}

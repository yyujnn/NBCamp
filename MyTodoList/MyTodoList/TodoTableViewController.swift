//
//  TodoTableViewController.swift
//  MyTodoList
//
//  Created by 정유진 on 2024/03/22.
//

import UIKit

class TodoTableViewController: UIViewController {
    
    var todoData = [TodoData]() {
        didSet {
            self.saveTasks()
        }
    }
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.allowsSelection = false
        todoTableView.rowHeight = 50
        self.loadTasks()

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
    
    // MARK: - UserDafults
    func saveTasks() {
        let data = self.todoData.map {
            [ 
                "id": $0.id,
                "title": $0.title,
                "isCompleted": $0.isCompleted
            ]
        }
        let userDafaults = UserDefaults.standard
        userDafaults.set(data, forKey: "todoData")
    }
    
    func loadTasks() {
        let userDafaults = UserDefaults.standard
        guard let data = userDafaults.object(forKey: "todoData") as? [[String: Any]] else { return }
        self.todoData = data.compactMap{
            guard let id = $0["id"] as? Int else { return nil }
            guard let title = $0["title"] as? String else { return nil }
            guard let isCompleted = $0["isCompleted"] as? Bool else { return nil }
            return TodoData(title: title, isCompleted: isCompleted)
        }
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
        cell.isCompletedSwitch.tag = indexPath.row
        cell.isCompletedSwitch.addTarget(self, action: #selector(tapSwitchButton(sender:)), for: .valueChanged)
        return cell
    }
    @objc func tapSwitchButton(sender: UISwitch) {
        print(sender.tag)
        let indexPath = IndexPath(row: sender.tag, section: 0)
        var todo = todoData[indexPath.row]
        todo.isCompleted = sender.isOn
        // 업데이트된 todo 객체로 todoData 배열을 다시 할당
        todoData[indexPath.row] = todo
        
        // 변경된 데이터를 UserDefaults에 저장
        saveTasks()
        print(todoData)
        todoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.todoData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            // 변경된 데이터를 UserDefaults에 저장
            saveTasks()
        }
    }
}


// delegate 역할
extension TodoTableViewController: UITableViewDelegate {
    /* func tableView(_ tableView: UITableView, didSelectRowAt
     indexPath: IndexPath) {
     tableView.deselectRow(at: indexPath, animated: true)
     print("Selected: \(todoData[indexPath.row])")
     
     } // -> 셀 눌렀을 때 동작
     */
}


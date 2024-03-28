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
    @IBOutlet weak var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.allowsSelection = false
        todoTableView.rowHeight = 50
        self.loadTasks()

    }
    // MARK: - edit 버튼
    @objc func doneButtonTap() {
        self.navigationItem.rightBarButtonItem = self.editButton
        self.todoTableView.setEditing(false, animated: true)
    }
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !self.todoData.isEmpty else { return }
        self.navigationItem.rightBarButtonItem = self.doneButton
        self.todoTableView.setEditing(true, animated: true)
        
    }
    // MARK: - add 버튼
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
        let indexPath = IndexPath(row: sender.tag, section: 0)
        var todo = todoData[indexPath.row]
        todo.isCompleted = sender.isOn
        // 업데이트된 todo 객체로 todoData 배열을 다시 할당
        todoData[indexPath.row] = todo
        
        // 변경된 데이터를 UserDefaults에 저장
        saveTasks()
        todoTableView.reloadData()
    }
    
    // MARK: - 삭제 기능
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.todoData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            // 변경된 데이터를 UserDefaults에 저장
            saveTasks()
        }
    }
    
    // MARK: - 할일의 순서를 바꿀 수 있는 기능 구현
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    // move row at:행이 다른 위치로 변경되면, souceIndexPath 파라미터를 통해 어디에 있었는지 알려주고, destinationIndexPath 파라미터를 통해 어디로 이동했는지 알려줌
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var todos = self.todoData
        let todo = todos[sourceIndexPath.row]
        todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
        self.todoData = todos
    }
}

// MARK: - Table view delegate
extension TodoTableViewController: UITableViewDelegate {
}


//
//  ListTableViewController.swift
//  MyTodoList
//
//  Created by 정유진 on 2024/03/27.
//

import Foundation
import UIKit

class ListTableViewController: UIViewController {

    var categories = Category.sampleData
    var selectedCategory: String?
 
    
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.rowHeight = 70
        
        listTableView.layer.cornerRadius = 10
        listTableView.clipsToBounds = true
    }
}

// MARK: - Table view data source
extension ListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        let list = categories[indexPath.row]
        cell.listLabel.text = list.name
        return cell
    }
}

// MARK: - Table view data delegate
extension ListTableViewController: UITableViewDelegate {
    
   func tableView(_ tableView: UITableView, didSelectRowAt
                   indexPath: IndexPath) {
       // -> 셀 눌렀을 때 동작
       tableView.deselectRow(at: indexPath, animated: true)
       let selecteCategory = categories[indexPath.row]
       print(selecteCategory)
       
    }
}



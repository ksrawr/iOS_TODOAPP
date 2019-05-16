//
//  ViewController.swift
//  TodoApp
//
//  Created by Khoi Dao on 5/15/19.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EditTask {
    
    @IBOutlet weak var completeTableView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var taskField: UITextField!
    
    @IBAction func addTask(_ sender: Any) {
        guard
            let taskInput = taskField.text
            else {
                print("Oops haha")
                return
        }
        
        print(taskInput)
        
        let task = Task(content: taskInput)
        
        tasks.append(task)
        
        self.tableView.reloadData()
        
    }
    
    @IBOutlet weak var indexField: UITextField!
    
    @IBOutlet weak var modField: UITextField!
    
    
    @IBAction func editTask(_ sender: Any) {
        guard
            let indexInput = indexField.text,
            let modInput = modField.text
            else {
                print("Oops haha")
                return
        }
        
        print(indexInput)
        print(modInput)

        tasks[Int(indexInput)!].content = modInput
        
        self.tableView.reloadData()
    }
    
    var tasks = [Task]()
    var tasksComp = [Task]()
    var selectedTask = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == completeTableView {
            return tasksComp.count
        }
        else {
            return tasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == completeTableView {
            tasksComp.remove(at: indexPath.row)
            
            self.tableView.reloadData()
            self.completeTableView.reloadData()
            
//            performSegue(withIdentifier: "editTaskScreen", sender: self)
        }
        else {
            let task = tasks[indexPath.row]
            task.completion = true
            
            tasksComp.append(task)
            
            tasks.remove(at: indexPath.row)
            
            self.tableView.reloadData()
            self.completeTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == completeTableView {
            let task = tasksComp[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CompletedTasksTableViewCell
            let index = indexPath.row
            cell.taskLabel.text = String(index) + ". " + task.content
            return cell
        }
        else {
            let task = tasks[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
            let index = indexPath.row
            cell.taskLabel.text = String(index) + ". " + task.content
            return cell
        }
    }
    
    func editTask(name: String, oldTask: String) {
//        for task in tasks {
//            if task.content == oldTask {
//                task.content = name
//                tableView.reloadData()
//                print("Replaced")
//            }
//        }
        tasks.append(Task(content: name))
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EditTaskViewController
        vc.finalTask = self.selectedTask
        vc.delegate = self
    }
}

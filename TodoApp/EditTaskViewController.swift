//
//  EditTaskViewController.swift
//  TodoApp
//
//  Created by Khoi Dao on 5/15/19.
//

import UIKit

protocol EditTask {
    func editTask(name: String, oldTask: String)
}

class EditTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var newTaskField: UITextField!
    
    @IBAction func replaceTask(_ sender: Any) {
        guard
            let newTaskInput = newTaskField.text
            else {
                print("Woops")
                return
        }
        
        delegate?.editTask(name: newTaskInput, oldTask: finalTask)
        navigationController
    }
    
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: self)
    }
    
    var delegate: EditTask?
    
    var finalTask = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taskLabel.text = finalTask
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

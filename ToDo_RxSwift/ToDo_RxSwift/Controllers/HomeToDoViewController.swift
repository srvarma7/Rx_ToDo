//
//  HomeToDoViewController.swift
//  ToDo_RxSwift
//
//  Created by Sai Raghu Varma Kallepalli on 14/8/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeToDoViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var taskPriorityCOntrol: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!

    private var tasks = BehaviorRelay<[Task]>(value: [])
    private var filteredTasks = [Task]()
    //private var tasks = Variable<[Task]>([])
    var filteredTask = [Task]()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        filterTasksByPriority()
        reloadTableView()
    }
    
    func listenToSegmentedControl() {
        //taskPriorityCOntrol.rx.base.didChangeValue(for: KeyPath<UISegmentedControl, Value>)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? CreateNewTaskVC else { fatalError("Error: Segue") }
        
        controller.taskSubjectObservable
            .subscribe( onNext: { [unowned self] task in
                //print(task)
                
                //To store the task to BehaviouralRelay task array
                var existingTask = self.tasks.value
                existingTask.append(task)
                self.tasks.accept(existingTask)
                
                //To store the task to Variable task array
                //self?.tasks.value.append(task)
                
                self.filterTasksByPriority()
                
                //self.reloadTableView()
            }).disposed(by: disposeBag)
    }
    
    func filterTasksByPriority() {
        let priority = Priority(rawValue: self.taskPriorityCOntrol.selectedSegmentIndex - 1)
        if priority == nil {
            self.filteredTask = self.tasks.value
        } else {
            self.tasks.map { task in
                return task.filter { $0.priority == priority! }
            }.subscribe( onNext: { [weak self] task in
                self?.filteredTask = task
                print(task)
                }).disposed(by: disposeBag)
        }
        reloadTableView()
    }

}

extension HomeToDoViewController: UITableViewDataSource {
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = filteredTask[indexPath.row]
        cell.textLabel?.text = task.task
        return cell
    }
}


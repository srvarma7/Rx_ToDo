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

    //private var tasks = BehaviorRelay<[Task]>(value: [])
    private var tasks = Variable<[Task]>([])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func listenToSegmentedControl() {
        //taskPriorityCOntrol.rx.base.didChangeValue(for: KeyPath<UISegmentedControl, Value>)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? CreateNewTaskVC else { fatalError("Error: Segue") }
        controller.taskSubjectObservable
            .subscribe( onNext: { [weak self] task in
                print(task)
                self?.tasks.value.append(task)
                self?.reloadTableView()
            }).disposed(by: disposeBag)
    }

}

extension HomeToDoViewController: UITableViewDataSource {
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = tasks.value[indexPath.row]
        cell.textLabel?.text = task.task
        return cell
    }
}


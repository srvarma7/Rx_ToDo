//
//  HomeToDoViewController.swift
//  ToDo_RxSwift
//
//  Created by Sai Raghu Varma Kallepalli on 14/8/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

class HomeToDoViewController: UIViewController, UITableViewDelegate {
    
    
    
    @IBOutlet weak var taskPriorityCOntrol: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension HomeToDoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Test"
        return cell
    }
}


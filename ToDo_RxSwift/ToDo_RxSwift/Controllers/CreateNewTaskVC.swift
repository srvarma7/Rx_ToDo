//
//  CreateNewTaskVC.swift
//  ToDo_RxSwift
//
//  Created by Sai Raghu Varma Kallepalli on 14/8/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

class CreateNewTaskVC: UIViewController {
    
    @IBOutlet weak var priorityControl: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //textField.inputAccessoryView = saveBtn
        
    }
    
    @IBAction func onSaveBtnTapped() {
        
    }

    @IBAction func onCloseBtnTapped() {
        dismiss(animated: true, completion: nil)
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

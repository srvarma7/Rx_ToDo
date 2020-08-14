//
//  TaskModal.swift
//  ToDo_RxSwift
//
//  Created by Sai Raghu Varma Kallepalli on 14/8/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import Foundation

struct Task {
    let task: String
    let priority: Priority
}

enum Priority: Int {
    case high
    case medium
    case low
}

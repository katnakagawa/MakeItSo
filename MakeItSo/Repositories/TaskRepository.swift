//
//  TaskRepository.swift
//  MakeItSo
//
//  Created by Katsuya Nakagawa on 2021/04/22.
//

import Foundation
import Combine

class BaseTaskRepository {
    @Published var tasks = [Task]()
}

protocol TaskRepository: BaseTaskRepository {
    func addTask(_ task: Task)
    func removeTask(_ task: Task)
    func updateTask(_ task: Task)
}

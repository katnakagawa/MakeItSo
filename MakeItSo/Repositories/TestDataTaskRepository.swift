//
//  TestDataTaskRepository.swift
//  MakeItSo
//
//  Created by Katsuya Nakagawa on 2021/04/22.
//

import Foundation

class TestDataTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject {
    override init() {
        super.init()
        self.tasks = testDataTasks
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
    
    func updateTask(_ task: Task) {
        if let index = self.tasks.firstIndex(where: { $0.id == task.id } ) {
            self.tasks[index] = task
        }
    }
}

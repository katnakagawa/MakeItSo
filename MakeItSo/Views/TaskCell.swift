//
//  TaskCell.swift
//  MakeItSo
//
//  Created by Katsuya Nakagawa on 2021/04/22.
//

import SwiftUI

enum InputError: Error {
  case empty
}

struct TaskCell: View {
  @ObservedObject var taskCellVM: TaskCellViewModel
  var onCommit: (Result<Task, InputError>) -> Void = { _ in }
  
  var body: some View {
    HStack {
      Image(systemName: taskCellVM.completionStateIconName)
        .resizable()
        .frame(width: 20, height: 20)
        .onTapGesture {
          self.taskCellVM.task.completed.toggle()
        }
      TextField("Enter task title", text: $taskCellVM.task.title,
                onCommit: {
                  if !self.taskCellVM.task.title.isEmpty {
                    self.onCommit(.success(self.taskCellVM.task))
                  }
                  else {
                    self.onCommit(.failure(.empty))
                  }
      }).id(taskCellVM.id)
    }
  }
}

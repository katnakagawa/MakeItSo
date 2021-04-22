//
//  TaskListView.swift
//  MakeItSo
//
//  Created by Katsuya Nakagawa on 2021/04/22.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    
    @State var presentAddNewItem = false
    @State var showSettingsScreen = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach (taskListVM.taskCellViewModels) { taskCellVM in
                        TaskCell(taskCellVM: taskCellVM)
                    }
                    .onDelete { indexSet in
                        self.taskListVM.removeTasks(atOffsets: indexSet)
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel.newTask()) { result in
                            if case .success(let task) = result {
                                self.taskListVM.addTask(task: task)
                            }
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                Button(action: { self.presentAddNewItem.toggle() }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("New Task")
                    }
                }
                .padding()
                .accentColor(Color(UIColor.systemRed))
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showSettingsScreen.toggle()
                                    }) {
                                        Image(systemName: "gear")
                                    }
            )
            .navigationBarTitle("Tasks")
            .sheet(isPresented: $showSettingsScreen) {
                SettingsView()
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

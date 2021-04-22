//
//  MakeItSoApp.swift
//  MakeItSo
//
//  Created by Katsuya Nakagawa on 2021/04/17.
//

import SwiftUI
import Firebase
import Resolver
import FirebaseFunctions

@main
struct MakeItSoApp: App {
    
    @LazyInjected var authenticationService: AuthenticationService

    init() {
        FirebaseApp.configure()
        
        authenticationService.signIn()
    }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}

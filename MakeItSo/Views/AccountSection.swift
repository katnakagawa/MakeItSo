//
//  AccountSection.swift
//  MakeItSo
//
//  Created by Katsuya Nakagawa on 2021/04/22.
//

import SwiftUI

struct AccountSection: View {
    @ObservedObject var settingsViewModel: SettingsViewModel
    @State private var showSignInView = false
    
    var body: some View {
        Section(footer: footer) {
            button
        }
    }
    
    var footer: some View {
        HStack {
            Spacer()
            if settingsViewModel.isAnonymous {
                Text("You're not logged in.")
            }
            else {
                VStack {
                    Text("Thanks for using Make It So, \(self.settingsViewModel.displayName)!")
                    Text("Logged in as \(self.settingsViewModel.email)")
                }
            }
            Spacer()
        }
    }
    
    var button: some View {
        VStack {
            if settingsViewModel.isAnonymous {
                Button(action: { self.login() }) {
                    HStack {
                        Spacer()
                        Text("Login")
                        Spacer()
                    }
                }
            }
            else {
                Button(action: { self.logout() }) {
                    HStack {
                        Spacer()
                        Text("Logout")
                        Spacer()
                    }
                }
            }
        }
        .sheet(isPresented: self.$showSignInView) {
            SignInView()
        }
    }
    
    func login() {
        self.showSignInView.toggle()
    }
    
    func logout() {
        self.settingsViewModel.logout()
    }    
}

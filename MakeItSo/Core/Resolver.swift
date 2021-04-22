//
//  Resolver.swift
//  MakeItSo
//
//  Created by Katsuya Nakagawa on 2021/04/22.
//

import Foundation
import Resolver
import FirebaseFunctions
import FirebaseFirestore

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    // register Firebase services
    register { Functions.functions() }.scope(.application)
    register { Firestore.firestore() }.scope(.application)
    
    // register application components
    register { AuthenticationService() }.scope(.application)
    register { FirestoreTaskRepository() as TaskRepository }.scope(.application)
  }
}

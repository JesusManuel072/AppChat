//
//  AppChatApp.swift
//  AppChat
//
//  Created by Jesús Navarro Antolin on 21/5/25.
//
import Combine
import SwiftUI
import FirebaseCore
import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import UIKit



@main

struct ChatApp: App {
  
        init() {
            FirebaseApp.configure()
    }

        var body: some Scene {
            WindowGroup {
                NavigationView {
                    ContentView()
    }
    }
    }
    }






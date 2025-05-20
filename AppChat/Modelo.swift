//
//  Modelo.swift
//  AppChat
//
//  Created by Jesús Navarro Antolin on 25/5/25.
//
import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore


struct Room: Identifiable, Codable {
    @DocumentID var id: String?
    let usuario: String
    let horaCreacion: Date
    let mensajes: [String] // Lista de mensajes dentro de la room
}

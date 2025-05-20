//
//  Untitled.swift
//  AppChat
//
//  Created by Jesús Navarro Antolin on 22/5/25.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct BienvenidaView: View {
    @State private var mensaje = ""
    @State private var mostrarRegistros = false
    let db = Firestore.firestore()

    var body: some View {
        VStack {
            Text("¡Bienvenido!")
.font(.title)
.padding()

            Button("Crear Nueva Room") {
                crearNuevaRoom()
}
.buttonStyle(.borderedProminent)

            Text(mensaje)
.foregroundColor(mensaje.contains("Error") ? Color.red : Color.green)
.padding()

            NavigationLink("", destination: RegistroView(), isActive: $mostrarRegistros)
}
}

    func crearNuevaRoom() {
        guard let usuario = Auth.auth().currentUser?.email else {
            mensaje = "Error: No se encontró usuario."
            return
}

        // Generar un identificador único para cada room
        let nuevaRoomRef = db.collection("salas").document()

        let nuevaRoom = Room(usuario: usuario, horaCreacion: Date(), mensajes: [])
        try? nuevaRoomRef.setData(from: nuevaRoom) { error in
            if let error = error {
                mensaje = "Error al crear la room: \(error.localizedDescription)"
} else {
                mensaje = "Room creada con éxito."
                mostrarRegistros = true
}
}
}
}
/*
struct BienvenidaView: View {
    @State private var mensaje = ""
    @State private var mostrarRegistros = false
    let db = Firestore.firestore()

    var body: some View {
        VStack {
            Text("¡Bienvenido!")
.font(.title)
.padding()

            Button("Crear Mi Room") {
                crearRoom()
}
.buttonStyle(.borderedProminent)

            Text(mensaje)
.foregroundColor(mensaje.contains("Error") ? Color.red : Color.green)
.padding()

            NavigationLink("", destination: RegistroView(), isActive: $mostrarRegistros)
}
}

    func crearRoom() {
        guard let usuario = Auth.auth().currentUser?.email else {
            mensaje = "Error: No se encontró usuario."
            return
}

        let salaRef = db.collection("salas").document(usuario) // Usamos el email como ID de la room

        salaRef.getDocument { document, error in
            if let error = error {
                mensaje = "Error al verificar salas: \(error.localizedDescription)"
                return
}

            if document?.exists == true {
                mensaje = "Tu room ya existe."
                mostrarRegistros = true
} else {
                let nuevaRoom = Room(usuario: usuario, horaCreacion: Date(), mensajes: [])
                try? salaRef.setData(from: nuevaRoom) { error in
                    if let error = error {
                        mensaje = "Error al crear la room: \(error.localizedDescription)"
} else {
                        mensaje = "Room creada con éxito."
                        mostrarRegistros = true
}
}
}
}
}
}

*/

/*
struct BienvenidaView: View {
    @State private var mensaje = ""
    let db = Firestore.firestore()

    var body: some View {
        VStack {
            Text("¡Bienvenido!")
.font(.title)
.padding()

            Button("Comprobar Base de Datos") {
                verificarOCrearSalas()
}
.buttonStyle(.borderedProminent)

            Text(mensaje)
                .foregroundColor(mensaje.contains("Error") ? Color.red : Color.green)
.padding()
}
}

    func verificarOCrearSalas() {
        let salasRef = db.collection("salas")

        salasRef.getDocuments { snapshot, error in
            if let error = error {
                mensaje = "Error al comprobar la base de datos: \(error.localizedDescription)"
                return
}

            // Si la colección ya existe (tiene documentos), no hacemos nada
            if let snapshot = snapshot,!snapshot.documents.isEmpty {
                mensaje = "La base de datos ya existe."
} else {
                // Si no existen documentos, creamos la colección con un primer dato
                salasRef.document("inicio").setData(["mensaje": "Base de datos creada"]) { error in
                    if let error = error {
                        mensaje = "Error al crear la base de datos: \(error.localizedDescription)"
} else {
                        mensaje = "Base de datos 'salas' creada con éxito."
}
}
}
}
}
}
*/


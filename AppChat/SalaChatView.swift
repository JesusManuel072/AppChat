//
//  SalaChatView.swift
//  AppChat
//
//  Created by Jesús Navarro Antolin on 2/6/25.
//

import SwiftUI
import FirebaseFirestore

struct SalaChatView: View {
    let roomID: String
    let roomNombre: String

    @State private var mensajes = [Mensaje]()
    @State private var nuevoMensaje = ""
    let db = Firestore.firestore()

    var body: some View {
        VStack {
            Text(" Sala: \(roomNombre)")
.font(.title)
.padding()

            List(mensajes) { mensaje in MessageBubble(mensaje: mensaje)
}

            HStack {
                TextField("Escribe un mensaje", text: $nuevoMensaje)
.textFieldStyle(.roundedBorder)
                Button("Enviar") {
                    enviarMensaje()
}
.buttonStyle(.borderedProminent)
}
.padding()
}
.onAppear(perform: cargarMensajes)
}

    func cargarMensajes() {
        db.collection("salas").document(roomID).collection("mensajes")
.order(by: "timestamp", descending: false)
.addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error al cargar mensajes:", error.localizedDescription)
                    return
}
                self.mensajes = snapshot?.documents.compactMap {
                    try? $0.data(as: Mensaje.self)
} ?? []
}
}

    func enviarMensaje() {
        let nuevo = Mensaje(contenido: nuevoMensaje, usuario: "Usuario", timestamp: Date())
        try? db.collection("salas").document(roomID).collection("mensajes").addDocument(from: nuevo)
        nuevoMensaje = ""
}
}

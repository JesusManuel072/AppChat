//
//  RegistroView.swift
//  AppChat
//
//  Created by Jesús Navarro Antolin on 25/5/25.
//

import SwiftUI
import FirebaseFirestore

struct RegistroView: View {
    @State private var rooms = [Room]()
    let db = Firestore.firestore()

    var body: some View {
        VStack {
            Text("Rooms de Usuarios")
.font(.title)
.padding()

            List(rooms) { room in
                VStack(alignment:.leading) {
                    Text("Usuario: \(room.usuario)")
.font(.headline)
                    Text("Creada el: \(room.horaCreacion.formatted())")
.font(.subheadline)
}
.padding()
}
}
.onAppear(perform: cargarRooms)
}

    func cargarRooms() {
        db.collection("salas").order(by: "horaCreacion")
         .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error al cargar rooms: \(error.localizedDescription)")
                    return
}
                self.rooms = snapshot?.documents.compactMap {
                    //snapshot?.documents → Contiene todos los registros de la colección "salas".
                    try? $0.data(as: Room.self)
} ?? []
}
}
}

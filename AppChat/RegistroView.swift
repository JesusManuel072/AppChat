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
                NavigationLink(destination: SalaChatView(roomID: room.id ?? "", roomNombre: room.usuario)) {
                    VStack(alignment:.leading) {
                        Text(" \(room.usuario)")
.font(.headline)
                        Text(" Creada el: \(room.horaCreacion.formatted())")
.font(.subheadline)
.foregroundColor(.gray)
}
.padding()
}
}
}
.onAppear(perform: cargarRooms)
}

    func cargarRooms() {
        db.collection("salas").order(by: "horaCreacion", descending: true)
.addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error al cargar rooms: \(error.localizedDescription)")
                    return
}
                self.rooms = snapshot?.documents.compactMap {
                    try? $0.data(as: Room.self)
} ?? []
}
}
}


/*
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
        
        /* Esto le dice a Firestore que queremos acceder a la base de datos que contiene las rooms creadas por los usuarios.    db.collection("salas").order(by: "horaCreacion") */
         db.collection("salas").order(by: "horaCreacion")
        
        // Esto escucha cambios en tiempo real en Firestore.
        // Si otro usuario crea una nueva room, esta función se ejecuta automáticamente y actualiza la lista.
        .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error al cargar rooms: \(error.localizedDescription)")
                    return
}
            //snapshot?.documents → Contiene todos los registros de la colección "salas"
            //compactMap → Convierte cada documento en un objeto Room
            self.rooms = snapshot?.documents.compactMap {
                
            // utilizando try? $0.data(as: Room.self)
            try? $0.data(as: Room.self)
                
            // ?? [] → Si snapshot es nil, usa una lista vacía para evitar errores
            } ?? []
        
            
            
}
}
}
*/

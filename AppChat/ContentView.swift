//
//  ContentView.swift
//  AppChat
//
//  Created by Jesús Navarro Antolin on 21/5/25.
//
import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore


struct ContentView: View {
        @State private var email = ""
        @State private var password = ""
        @State private var mostrarBienvenida = false
        @State private var mostrarError = false
        @State private var mensajeError = ""

        var body: some View {
            VStack {
                TextField("Correo electrónico", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)

                SecureField("Contraseña", text: $password)
                    .textFieldStyle(.roundedBorder)

                HStack {
                    Button("Registrarse") {
                        registrarUsuario()
                        }
                        .buttonStyle(.borderedProminent)

                    Button("Iniciar Sesión") {
                        iniciarSesion()
                        }
                        .buttonStyle(.bordered)
                        }

                if mensajeError != "" {
                    Text(mensajeError)
                        .foregroundColor(.red)
                        .padding()
                        }

                                    NavigationLink("", destination: BienvenidaView(), isActive: $mostrarBienvenida)
                                    NavigationLink("", destination: ErrorView(errorMensaje: mensajeError), isActive: $mostrarError)
                        }
                        .padding()
                        }

        func registrarUsuario() {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    mensajeError = "Error al registrarse: \(error.localizedDescription)"
                    mostrarError = true
                    return
    }
                mostrarBienvenida = true
    }
    }

        func iniciarSesion() {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    mensajeError = "Error al iniciar sesión: \(error.localizedDescription)"
                    mostrarError = true
                    return
    }
                mostrarBienvenida = true
    }
    }
    }

//
//  ErrorView.swift
//  AppChat
//
//  Created by Jesús Navarro Antolin on 23/5/25.
//

import SwiftUI

struct ErrorView: View {
    let errorMensaje: String

    var body: some View {
        VStack {
            Text(errorMensaje)
.font(.title)
.foregroundColor(.red)
.padding()

            Button("Volver") {
                // Acción para volver a la vista de inicio
}
.buttonStyle(.borderedProminent)
}
}
}

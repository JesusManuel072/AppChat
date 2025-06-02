//
//  MessageBubble.swift
//  AppChat
//
//  Created by Jesús Navarro Antolin on 2/6/25.
//

import SwiftUI

struct MessageBubble: View {
  
    let mensaje: Mensaje

    var body: some View {
        HStack {
            Text(mensaje.contenido)
.padding()
.background(Color.blue.opacity(0.7))
.clipShape(RoundedRectangle(cornerRadius: 12))
}
.frame(maxWidth:.infinity, alignment: mensaje.usuario == "Usuario" ? .trailing : .leading)
        
.padding(.horizontal)
}
}

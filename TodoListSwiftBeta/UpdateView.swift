//
//  UpdateView.swift
//  TodoListSwiftBeta
//
//  Created by Marco Alonso on 13/09/24.
//

import SwiftUI

struct UpdateView: View {
    /// se actualizara en la bd
    @Bindable var video: Video
    
    var body: some View {
        Form {
            TextField("Editar el proximo video",text: $video.title)
            Toggle("Video favorito", isOn: $video.metadata.isFavorite)
        }
    }
}

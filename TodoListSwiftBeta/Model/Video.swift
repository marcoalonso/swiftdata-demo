//
//  Video.swift
//  TodoListSwiftBeta
//
//  Created by Marco Alonso on 13/09/24.
//

import Foundation
import SwiftData

// Esquema
@Model
class Video {
    /// Definir un valor unico
    @Attribute(.unique) var id: UUID
    var title: String
    
    /// Si deseas que un valor no se almacene en la base de datos se usa Transient
    @Transient var numberOfLikes: Int { title.count }
    
    @Relationship var metadata: Metadata /// Crear la realacion de video - metadata
    
    init(id: UUID, title: String, metadata: Metadata) {
        self.id = id
        self.title = title
        self.metadata = metadata
    }
}

@Model
class Metadata {
    var isFavorite: Bool
    
    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
}

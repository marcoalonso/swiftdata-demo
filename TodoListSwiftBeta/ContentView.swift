//
//  ContentView.swift
//  TodoListSwiftBeta
//
//  Created by Marco Alonso on 13/09/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    /// * Añadir la propiedad que da acceso al contexto
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Video.title) var videos: [Video]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(videos) { video in
                    NavigationLink(value: video) {
                        HStack {
                            Text(video.title)
                            if video.metadata.isFavorite {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Videos in Bootcamp Mx iOS")
            .toolbar {
                ToolbarItem {
                    Button {
                        withAnimation {
                            let newVideo = Video(id: .init(),
                                                 title: "Spenses Report",
                                                 metadata: .init(isFavorite: true))
                            modelContext.insert(newVideo)
                        }
                    } label: {
                        Label("Add Video", systemImage: "plus")
                    }

                }
            }
        }
        
    }
}

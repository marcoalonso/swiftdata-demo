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
    // @Environment(\.modelContext) var modelContext
    // @Query(sort: \Video.title) var videos: [Video] // Select * from
    
    /// To search only specific elements
     /*
    @Query(filter: #Predicate<Video> { video in
        video.title == "SwiftUI"
    }) var videos: [Video]
      */
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.videos) { video in
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
            .navigationDestination(for: Video.self, destination: { video in
                UpdateView(video: video)
            })
            .toolbar {
                ToolbarItem {
                    Button {
                        withAnimation {
                            let newVideo = Video(id: .init(),
                                                 title: "Video de prueba",
                                                 metadata: .init(isFavorite: true))
                            // modelContext.insert(newVideo)
                            viewModel.insert(video: newVideo)
                        }
                    } label: {
                        Label("Add Video", systemImage: "plus")
                    }

                }
                ToolbarItem {
                    Button {
                        withAnimation {
                            /*viewModel.videos.forEach {
                                modelContext.delete($0)
                            }
                            try? modelContext.save()*/
                            viewModel.deleteAllVideos()
                        }
                    } label: {
                        Label("Remove All", systemImage: "trash")
                    }
                }
            }
            .onAppear{
                viewModel.getVideos()
            }
        }
        
    }
}

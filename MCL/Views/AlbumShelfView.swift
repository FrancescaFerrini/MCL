//
//  AlbumShelfView.swift
//
//  Created by Fernando Sensenhauser on 13/05/24.
//

import SwiftUI
import SwiftData

struct AlbumShelfView: View {
    @Environment(\.modelContext) private var context
    
    @State var albumTitle: String = ""
    @State var name: String?
    @State private var showingAddAlbumSheet: Bool = false

    @State private var path: [Album] = []
    @State private var newAlbum: Album?
    @State private var currentEditingAlbum: Album?

    @State var offsetToCenter = UIScreen.main.bounds.width/9
    
    @State private var showingDeleteConfirmation = false
    @State private var showingOptionsMenu = false
    
    @State private var showingEditAlbumSheet: Bool = false
    @State private var showingDeleteAlert = false

    
    @Query(sort: \Album.dateCreated, order: .reverse) var albums: [Album]
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 2) {
                        ForEach(albums) { album in
                            VStack {
                                Spacer()
                                ZStack {
                                    NavigationLink(destination: BookletView(album: album)){
                                        
                                        AlbumCard(album: album, isExpanded: false)
                                            .shadow(color: Color.black.opacity(0.15), radius: 20)
                                            .padding()
                                            .contextMenu(ContextMenu(menuItems: {
                                                Button("Delete", role: .destructive) {
                                                    showingDeleteConfirmation = true
                                                }
                                            }))
                                            .alert(isPresented:$showingDeleteConfirmation) {
                                                Alert(
                                                    title: Text("Are you sure you want to delete this album?"),
                                                    message: Text("There is no undo"),
                                                    primaryButton: .destructive(Text("Delete")) {
                                                        context.delete(album)
                                                    },
                                                    secondaryButton: .cancel()
                                                )
                                            }
                                    }
                                        Menu {
                                            Button(action: {
                                                currentEditingAlbum = album
                                            }){
                                                Label("Edit Album",systemImage: "pencil")
                                            }
                                            Divider()
                                            Button(role: .destructive) {
                                                showingDeleteConfirmation = true
                                            } label: {
                                                Label("Delete", systemImage: "trash")
                                            }
                                        } label: {
                                            Image(systemName: "ellipsis.circle.fill")
                                                .foregroundStyle(.pink,.white.opacity(0.3))
                                                .font(.system(size: 26))
                                        }
                                        .offset(x: 120, y: -120)
                                }
                                VStack {
                                    Text(album.title)
                                        .bold()
                                        .font(.title2)
                                        .frame(width: screenWidth / 1.5)
                                        .multilineTextAlignment(.center)
                                    
                                    
                                    if album.dateFrom != nil || album.dateTo != nil {
                                            Rectangle()
                                                .frame(width: 272, height: 5)
                                                .cornerRadius(15)
                                                .foregroundColor(Color.pink)
                                        }
                                        
                                        
                                    // Display dates if they exist
                                    if album.dateTo != nil {
                                        HStack {
                                            Text(album.dateFrom!, style: .date)
                                                .foregroundStyle(Color.gray)
                                                .font(.footnote)
                                            Text("-")
                                                .foregroundStyle(Color.gray)
                                                .font(.footnote)
                                            Text(album.dateTo!, style: .date)
                                                .foregroundStyle(Color.gray)
                                                .font(.footnote)
                                        }
                                    } else if album.dateFrom != nil && album.dateTo == nil {
                                        HStack {
                                            Text(album.dateFrom!, style: .date)
                                                .foregroundStyle(Color.gray)
                                                .font(.footnote)
                                        }
                                    }

                                    
                                    Spacer()
                                        
                                }.padding(.top, 10)
                            }
                            .padding(.horizontal, -45)
                            .scrollTransition (topLeading: .interactive, bottomTrailing: .interactive, axis: .horizontal) { effect, phase in
                                effect
                                    .scaleEffect(1 - abs(phase.value))
                                    .opacity(1 - abs(phase.value))
                                    .rotation3DEffect(
                                        .degrees(phase.value / 90),
                                        axis: (x: 0, y: 1, z: 0)
                                    )
                            }
                        }
                    }
                    .scrollTargetLayout()
                    .padding()
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                .overlay {
                    if albums.isEmpty {
                        ContentUnavailableView(label: {
                            Label("No albums have been created", systemImage: "opticaldisc.fill")
                        }, description: {
                            Text("Create an album to see it in your shelf")
                        }, actions: {
                            Button("Create album") { showingAddAlbumSheet = true }
                        })
                        .offset(y: -offsetToCenter)
                    }
                }
            }
            .navigationTitle("Albums")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        showingAddAlbumSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(item: $currentEditingAlbum) { album in
                            EditAlbumView(album: album)
                                .onDisappear {
                                    currentEditingAlbum = nil
                                }
                        }
            .sheet(isPresented: $showingAddAlbumSheet, onDismiss: {
                if let album = newAlbum {
                    path.append(album)
                    newAlbum = nil
                }
            }) {
                AddAlbumView(newAlbum: $newAlbum)
            }
            .navigationDestination(for: Album.self) { album in
                BookletView(album: album)
            }
            
        }
    }
}

//
//  EntrySongCard.swift
//  MCL
//
//  Created by Eduardo Gonzalez Melgoza on 01/06/24.
//

import SwiftUI
import SwiftData

struct EntrySongCard: View {
    @StateObject private var viewModel = SongColorViewModel()
    
    let song: SongFromCatalog
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color.white, location: 0.0),
                        .init(color: Color.black, location: 5.0)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: viewModel.averageColor, location: 0.0),
                        .init(color: Color.black, location: 2.0)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .opacity(0.7)  // Adjust opacity as needed
            
            VStack {
                HStack {
                    if let url = song.imageURL {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 55, height: 55)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .padding(.trailing, 5)
                                    .onAppear {
                                        // Fetch the color when the image appears
                                        viewModel.fetchImageColor(from: url)
                                    }
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .padding()
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading) {
                        Text(song.name)
                            .fontWeight(.medium)
                            .lineLimit(1)
                            .foregroundStyle(Color.white)
                        
                        Text(song.artist)
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack {
                    ForEach(song.entries) { entry in
                        if entry.prompt != "" {
                            Text(entry.prompt ?? "")
                                .padding([.top, .leading, .trailing])
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.white)
                                .bold()
                            Divider()
                                .padding(.horizontal)
                        }
                        Text(entry.entryText)
                            .padding()
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding() // Add padding to the VStack to create space around the content
        }
        .frame(width: UIScreen.main.bounds.width / 1.1)
        .fixedSize(horizontal: false, vertical: true) // Allow the ZStack to resize vertically based on content
    }
}

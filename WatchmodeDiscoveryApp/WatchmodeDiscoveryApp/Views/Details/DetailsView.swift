//
//  DetailsView.swift
//  WatchmodeDiscoveryApp
//
//  Created by NIKHIL on 14/01/26.
//

import SwiftUI

struct DetailsView: View {

    let item: MediaItem

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                AsyncImage(url: URL(string: item.poster_url ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 320)
                .cornerRadius(12)

                Text(item.title)
                    .font(.largeTitle)
                    .bold()

                Text("Release Year: \(item.year ?? 0)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

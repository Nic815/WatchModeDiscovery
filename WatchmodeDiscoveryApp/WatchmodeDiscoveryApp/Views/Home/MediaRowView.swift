//
//  MediaRowView.swift
//  WatchmodeDiscoveryApp
//
//  Created by NIKHIL on 14/01/26.
//

import SwiftUI

struct MediaRowView: View {

    let item: MediaItem

    var body: some View {
        HStack(spacing: 12) {

            AsyncImage(url: URL(string: item.poster_url ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 70, height: 100)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .font(.headline)
                    .lineLimit(2)

                Text("Year: \(item.year ?? 0)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
    }
}

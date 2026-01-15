//
//  MediaItem.swift
//  WatchmodeDiscoveryApp
//
//  Created by NIKHIL on 14/01/26.
//

struct MediaItem: Identifiable, Decodable {
    let id: Int
    let title: String
    let year: Int?
    let poster_url: String?
}


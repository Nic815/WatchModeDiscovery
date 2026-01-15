//
//  WatchmodeService.swift
//  WatchmodeDiscoveryApp
//
//  Created by NIKHIL on 14/01/26.
//


import Combine
import Foundation

class WatchmodeService {
    private let apiKey = "5KFFN5iaIPaTUL1IIbIz2MgKYBV6VDQPXNYmHLdj"

    func fetchMovies() -> AnyPublisher<[MediaItem], Error> {
        let url = URL(string:
            "https://api.watchmode.com/v1/list-titles/?apiKey=\(apiKey)&types=movie"
        )!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MediaResponse.self, decoder: JSONDecoder())
            .map { $0.titles }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func fetchTVShows() -> AnyPublisher<[MediaItem], Error> {
        let url = URL(string:
            "https://api.watchmode.com/v1/list-titles/?apiKey=\(apiKey)&types=tv_series"
        )!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MediaResponse.self, decoder: JSONDecoder())
            .map { $0.titles }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

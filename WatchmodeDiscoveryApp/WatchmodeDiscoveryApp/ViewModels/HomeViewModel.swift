//
//  HomeViewModel.swift
//  WatchmodeDiscoveryApp
//
//  Created by NIKHIL on 14/01/26.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    @Published var movies: [MediaItem] = []
    @Published var tvShows: [MediaItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = WatchmodeService()
    private var cancellables = Set<AnyCancellable>()

    func fetchData() {
        isLoading = true

        Publishers.Zip(
            service.fetchMovies(),
            service.fetchTVShows()
        )
        .sink { completion in
            self.isLoading = false
            if case let .failure(error) = completion {
                self.errorMessage = error.localizedDescription
            }
        } receiveValue: { movies, shows in
            self.movies = movies
            self.tvShows = shows
        }
        .store(in: &cancellables)
    }
}

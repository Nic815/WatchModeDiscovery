//
//  HomeView.swift
//  WatchmodeDiscoveryApp
//
//  Created by NIKHIL on 14/01/26.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()
    @State private var showMovies = true

    var body: some View {
        NavigationView {
            VStack {

                Picker("Select", selection: $showMovies) {
                    Text("Movies").tag(true)
                    Text("TV Shows").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if viewModel.isLoading {
                    VStack {
                        ProgressView()
                        Text("Loading...")
                    }
                    .redacted(reason: .placeholder)
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(showMovies ? viewModel.movies : viewModel.tvShows) { item in
                                NavigationLink {
                                    DetailsView(item: item)
                                } label: {
                                    MediaRowView(item: item)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Discover")
            .onAppear {
                viewModel.fetchData()
            }
            .alert(item: Binding(
                get: {
                    viewModel.errorMessage.map { ErrorWrapper(message: $0) }
                },
                set: { _ in viewModel.errorMessage = nil }
            )) { wrapper in
                Alert(
                    title: Text("Error"),
                    message: Text(wrapper.message),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

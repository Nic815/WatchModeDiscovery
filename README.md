# 🎬 Watchmode Discovery App (iOS – SwiftUI)

A lightweight **Movie & TV Show discovery iOS application** built using **SwiftUI**, **Combine**, and **MVVM architecture**, powered by the **Watchmode API**.  
This project focuses on clean architecture, efficient API handling, and modern SwiftUI practices.

---

## 📱 Features

- 🔍 Discover **Movies & TV Shows**
- 🔁 Toggle between **Movies / TV Shows**
- ⚡ Parallel API calls using **Combine `Publishers.Zip`**
- 📜 Smooth scrolling with **LazyVStack**
- ⏳ Loading state using **redacted (shimmer-like) UI**
- 🚨 Graceful error handling with **SwiftUI Alerts**
- 🧠 Clean **MVVM Architecture**
- 📄 Detailed screen for each item
- 🧪 Unit test coverage for ViewModel

---

## 🛠️ Tech Stack

- **Language:** Swift  
- **UI Framework:** SwiftUI  
- **Architecture:** MVVM  
- **Reactive Framework:** Combine  
- **API:** Watchmode API  
- **Concurrency:** Publishers.Zip  
- **Testing:** XCTest  

---

## 🏗️ Project Architecture (MVVM)

```
WatchmodeDiscoveryApp
│
├── Models
│ ├── MediaItem.swift
│ └── MediaResponse.swift
│
├── Services
│ └── WatchmodeService.swift
│
├── ViewModels
│ └── HomeViewModel.swift
│
├── Views
│ ├── Home
│ │ ├── HomeView.swift
│ │ └── MediaRowView.swift
│ │
│ └── Details
│ └── DetailsView.swift
│
├── Utilities
│ └── ErrorWrapper.swift
│
└── Tests
└── HomeViewModelTests.swift
```

---

## 🌐 API Integration

The app uses the **Watchmode API** to fetch Movies and TV Shows.

### Endpoints Used

**Movies**
```
GET https://api.watchmode.com/v1/list-titles/?types=movie
```

**TV Shows**
```
GET https://api.watchmode.com/v1/list-titles/?types=tv_series
```

---

## ⚡ Parallel API Calls with Combine

Both Movies and TV Shows are fetched **simultaneously** using Combine:

```
swift
Publishers.Zip(
    fetchMovies(),
    fetchTVShows()
)
```


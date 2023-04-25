//
//  HomeViewModel.swift
//  MyCrypto
//
//  Created by kaiserdem  on 09.04.2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var ststistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -7)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""

    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates all coins
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        //
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // waiting 0.5 sec for launch next code
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowecasedText = text.lowercased()
        
        return coins.filter { coin in
            return coin.name.lowercased().contains(lowecasedText) ||
            coin.symbol.lowercased().contains(lowecasedText) ||
            coin.id.lowercased().contains(lowecasedText)
        }
    }
}

//
//  PreviewProvider.swift
//  MyCrypto
//
//  Created by kaiserdem  on 07.04.2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let homeVM = HomeViewModel()
    
    let state1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let state2 = StatisticModel(title: "Total Value", value: "$1.23Tr")
    let state3 = StatisticModel(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)

    let coin = CoinModel(id: "bitcoin",
                         symbol: "btc",
                         name: "Bitcoin",
                         image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                         currentPrice: 28138,
                         marketCap: 544204666857,
                         marketCapRank: 1,
                         fullyDilutedValuation: 590948343112,
                         totalVolume: 590948343112,
                         high24H: 28279, low24H: 27850,
                         priceChange24H: 54.22,
                         priceChangePercentage24H: 0.19307,
                         marketCapChange24H: 332107151,
                         marketCapChangePercentage24H: 0.06106,
                         circulatingSupply: 19338912.0,
                         totalSupply: 21000000.0,
                         maxSupply: 21000000.0,
                         ath: 69045,
                         athChangePercentage: 59.24326,
                         athDate: "2021-11-10T14:24:11.849Z",
                         atl: 67.81,
                         atlChangePercentage: 41399.50197,
                         atlDate: "2013-07-06T00:00:00.000Z",
                         lastUpdated: "2023-04-06T16:02:33.992Z",
                         sparklineIn7D: CoinModel.SparklineIn7D(price:[28682.10047654948, 28683.25845465232]),
                         priceChangePercentage24HInCurrency: 0.1930727214080331,
                         currentHoldings: 1.5)
    }


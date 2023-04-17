//
//  CoinImageService.swift
//  MyCrypto
//
//  Created by kaiserdem  on 12.04.2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscriptions: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String

    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage  = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            ///print("Retrived image from File Manager!")
        } else {
            downlodCoinImage()
            ///print("Download image now!")
        }
    }
    
    private func downlodCoinImage() {
        guard let url = URL(string: coin.image) else { return }
     
        imageSubscriptions = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = returnedImage
                self.imageSubscriptions?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}

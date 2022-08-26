//
//  Part1ViewModel.swift
//  HW5
//
//  Created by Ponomarev Maksim on 25.08.2022.
//

import Foundation

protocol Part1ViewModel{
    var numberOfItems: Int { get }
    func item(index: Int) -> SomeObject
    var itemsChanged: (() -> ())? { get set }
    func handleViewReady()
    
}

class Part1ViewModelImp: Part1ViewModel {

    private var semaphore = DispatchSemaphore(value: 1)
    private let custQueue = DispatchQueue(label: "fetchData")
    
    private let networkService: Networkp1Service
    private let urlString: String
    
    private var someObjectArray: [SomeObject] = [] {
        didSet {
            if someObjectArray.count > 0 {
                print("Data loaded")
                self.itemsChanged?()
            }
        }
    }
    
    init(networkService: Networkp1Service = Networkp1ServiceImp(), stringUrl: String = URL_StringForFetchP1) {
        self.networkService = networkService
        self.urlString = stringUrl
    }
    
    var numberOfItems: Int {
        return someObjectArray.count
    }
    
    func item(index: Int) -> SomeObject {
        return someObjectArray[index]
    }
    
    var itemsChanged: (() -> ())?
    
    func handleViewReady() {
        self.custQueue.async {
            Task{
                self.someObjectArray = await self.fetchDataFromServer()
            }
            self.itemsChanged?()
        }
    }
    
    private func fetchDataFromServer() async -> [SomeObject] {
        let collData = await networkService.fetchData(urlString: urlString)
        return collData
    }



}

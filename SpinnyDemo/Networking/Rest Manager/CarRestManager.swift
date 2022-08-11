//
//  CarRestManager.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 09/08/22.
//

import Foundation
import Moya

class CarRestManager: NSObject {
    private var provider = MoyaProvider<CarsAPI>()
    static var shared = CarRestManager()
    
    func getCarsMake(handler: ((Result<CarMakeResponse,Error>)->())?) {
        self.provider.request(.getCarsMake) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(CarMakeResponse.self, from: response.data)
                    handler?(.success(decodedData))
                } catch let error {
                    handler?(.failure(error))
                }
            case .failure(let error):
                handler?(.failure(error))
            }
        }
    }
    
    func getCarsModel(makeID: Int, handler: ((Result<CarModelResponse,Error>)->())?) {
        self.provider.request(.getCarsModel(makeID: makeID)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(CarModelResponse.self, from: response.data)
                    handler?(.success(decodedData))
                } catch let error {
                    handler?(.failure(error))
                }
            case .failure(let error):
                handler?(.failure(error))
            }
        }
    }
}

//
//  BeerListService.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import Foundation

protocol BeerListApi: AnyObject {
    func getBeerList(completion: @escaping((Result<[Beer], Error>) -> Void))
}

final class BeerListService: BeerListApi {
    func getBeerList(completion: @escaping((Result<[Beer], Error>) -> Void)) {
        guard let url = URL(string: AleHouseConstants.EndPoints.beerList) else { completion(.failure(GenericError())); return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            if let data = data {
                do {
                    let response = try JSONDecoder().decode([Beer].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(response))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(EmptyResponseError()))
                    }
                }
            }
        }.resume()
    }
}

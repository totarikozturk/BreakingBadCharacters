//
//  CharacterService.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 29.09.2022.
//

import Alamofire
import UIKit

class CharacterService {

    func getCharacters(completionHandler: @escaping (Result<Search, Error>) -> Void) {
        AF.request(API.charURL, method: .get).response { response in
            switch response.result {
            case .success:
                if let jsonData = response.data {
                    do {
                        let characters = try JSONDecoder().decode(Search.self, from: jsonData)
                        completionHandler(.success(characters))
                    } catch {
                        completionHandler(.failure(error))
                    }
                }

            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}

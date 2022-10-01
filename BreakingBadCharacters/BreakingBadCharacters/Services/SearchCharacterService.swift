//
//  SearchCharacterService.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 1.10.2022.
//

import Alamofire
import UIKit

class SearchCharacterService {

    static func getSearchCharacter(name: String, completionHandler: @escaping (Result<Search, Error>) -> Void) {
        AF.request((API.searchCharURL + name), method: .get).response { response in
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

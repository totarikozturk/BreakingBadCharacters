//
//  HomeViewModel.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 30.09.2022.
//

import Foundation

class HomeViewModel {

    var char = Search()
    var timer: Timer?

    func getData(completion: @escaping () -> Void) {
        CharacterService.getCharacters {  result in
            switch result {
            case .success(let char):
                self.char = char
                completion()

            case .failure(let error):
                print(error)
            }
        }
    }

    func getSearchCharData(name: String, completion: @escaping () -> Void) {
        SearchCharacterService.getSearchCharacter(name: name) { result in
            switch result {
            case .success(let char):
                self.char = char
                completion()

            case .failure(let error):
                print(error)
            }
        }
    }

    func createTimer(completion: @escaping () -> Void) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 10.0,
                                         target: self,
                                         selector: #selector(updateTimer),
                                         userInfo: nil,
                                         repeats: true)
        }
    }

    @objc func updateTimer() {
        getData {
            print("updated data")
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        if !char.isEmpty {
            return char.count
        }
        return 0
    }

    func cellForRowAt (indexPath: IndexPath) -> SearchElement {
        char[indexPath.row]
    }

    func didSelectedRowAt (indexPath: IndexPath) -> SearchElement {
        char[indexPath.row]
    }
}

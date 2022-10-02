//
//  HomeViewModel.swift
//  BreakingBadCharacters
//
//  Created by TarıkOzturk on 30.09.2022.
//

import Foundation

class HomeViewModel {

    private var char = Search()

    // Timer not change to private because timer will be invalidate in HomeViewcontroller
    var timer: Timer?

    private let characterService: CharacterService
    private let searchCharacterService: SearchCharacterService

    init(characterService: CharacterService = .init(),
         searchCharacterService: SearchCharacterService = .init()) {

        self.characterService = characterService
        self.searchCharacterService = searchCharacterService
    }

    func getData(completion: @escaping () -> Void) {
        characterService.getCharacters {  result in
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
        searchCharacterService.getSearchCharacter(name: name) { result in
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
            completion()
        }
    }

    @objc func updateTimer() {
        getData {
            if self.char.last?.name == self.char.last?.name {
                print("Data is same, nothing changed")
            }
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

//
//  MatchFixtureViewModel.swift
//  Sportz
//
//  Created by webwerks on 07/02/23.
//

import Foundation

//https://demo.sportz.io/nzin01312019187360.json
//https://demo.sportz.io/sapk01222019186652.json

class MatchFixtureViewModel {
    var matchData : [MatchDetailResponse] =  [MatchDetailResponse]()
    let networkManager = NetworkManager()
    func fetchMatchDetails(completion:@escaping ()->()){
        let dispatchgroup = DispatchGroup()
        dispatchgroup.enter()
        networkManager.request(fromURL: URL(string: "https://demo.sportz.io/sapk01222019186652.json"), completion: { [self] (result: Result<MatchDetailResponse, Error>) in
            switch result {
            case .success(let data):
                debugPrint("We got a successful result with \(data) users.")
                self.matchData.append(data)
            case .failure(let error):
                debugPrint("We got a failure trying to get the users. The error we got was: \(error.localizedDescription)")
            }
            //completion()
            dispatchgroup.leave()
            
        })
        dispatchgroup.enter()
        networkManager.request(fromURL: URL(string: "https://demo.sportz.io/nzin01312019187360.json"), completion: { (result: Result<MatchDetailResponse, Error>) in
            switch result {
            case .success(let data):
                debugPrint("We got a successful result with \(data) users.")
                self.matchData.append(data)
            case .failure(let error):
                debugPrint("We got a failure trying to get the users. The error we got was: \(error.localizedDescription)")
            }
            completion()
            dispatchgroup.leave()
        })
        dispatchgroup.notify(queue: .main) {
            print("all finished.")
        }
        
    }
    
    
    
}
    
    
    


//
//  MatchDetailsViewModel.swift
//  Sportz
//
//  Created by webwerks on 09/02/23.
//

import Foundation

class MatchDetailsViewModel {
    
    var matchdata : MatchDetailResponse?
    var sections : [String]? = []
    
    init (matchData: MatchDetailResponse){
        self.matchdata = matchData
    }
    
    func DisplayPlayer(team : String, int : Int)-> Player?{
        return matchdata?.teams?[team]?.playersList[int]
    }

    
    func isCaptainAndKeeper(player: Player) -> Bool{
        player.isCaptain ?? false && player.isKeeper ?? false
        
    }
    
    func isCaptain(player: Player) -> Bool{
        player.isCaptain ?? false
    }
    
    func iswicketKeeper(player: Player) -> Bool {
        player.isKeeper ?? false
    }
    
    func getPlayerRole(player: Player) -> String {
        
        if isCaptainAndKeeper(player: player) {
            return "[C & WK]"
        }
        if isCaptain(player: player) {
            return "[C]"
        }
        if iswicketKeeper(player: player) {
            return "[WK]"
        }
        
        return ""
    }
    
    func numberOfSections() -> Int {
        matchdata?.teams?.count ?? 0
    }
    
}


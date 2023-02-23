//
//  MatchDetailsViewController.swift
//  Sportz
//
//  Created by webwerks on 09/02/23.
//

import UIKit

class MatchDetailsViewController: UIViewController {
    var matchdetailsviewmodel : MatchDetailsViewModel?
    var teamHome = ""
    var teamAway = ""
    var playerName: String?
    @IBOutlet weak var playerDetailsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Squads"
        self.playerDetailsTable.reloadData()
    }
}

extension MatchDetailsViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return matchdetailsviewmodel?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return  matchdetailsviewmodel?.matchdata?.teams?[teamHome]?.playersList.count ?? 0
        } else {
            return  matchdetailsviewmodel?.matchdata?.teams?[teamAway]?.playersList.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerDetailsTable.dequeueReusableCell(withIdentifier: "MatchDetailsTableViewCell", for: indexPath) as! MatchDetailsTableViewCell
        
        switch indexPath.section {
            
        case 0 :
            guard let player = matchdetailsviewmodel?.DisplayPlayer(team: teamHome, int: indexPath.row) else {return UITableViewCell()}
            
            playerName = "\(player.nameFull ?? "")" + "\(matchdetailsviewmodel?.getPlayerRole(player: player) ?? "")"
            
            break
        default:
            guard let player = matchdetailsviewmodel?.DisplayPlayer(team: teamAway,
                                                                    int: indexPath.row) else {return UITableViewCell()}
            
            playerName = "\(player.nameFull ?? "")" + "\(matchdetailsviewmodel?.getPlayerRole(player: player) ?? "")"
        }
        
        cell.playersName.text = playerName ?? ""
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            let player = matchdetailsviewmodel?.matchdata?.teams?[teamHome]?.nameFull
            return player
        } else {
            let player = matchdetailsviewmodel?.matchdata?.teams?[teamAway]?.nameFull
            return player
        }
    }
 
}

extension MatchDetailsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let player = matchdetailsviewmodel?.matchdata?.teams?[teamHome]?.playersList[indexPath.row]{
            showPlayerDetailsAlert(player: player)
        }else {
            let player = matchdetailsviewmodel?.matchdata?.teams?[teamAway]?.playersList[indexPath.row]
            showPlayerDetailsAlert(player: player)
        }
    }
    func showPlayerDetailsAlert(player:Player?){
        let playersstyle = player?.batting?.style?.rawValue
        let playerBowlingStyle = player?.bowling?.style
        let message = "Batting Style \(playersstyle ?? ""), \n Bowling Style \(playerBowlingStyle ?? "")"
        let alert = UIAlertController(title: "PlayerDetail",
                                      message: message ,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


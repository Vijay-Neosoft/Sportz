//
//  MatchFixtureViewController.swift
//  Sportz
//
//  Created by webwerks on 07/02/23.
//

import UIKit

class MatchFixtureViewController: UIViewController {
    var matchfixtureViewModel = MatchFixtureViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    var teamHome: String?
    var teamAway : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MatchFixtureTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchFixtureTableViewCell")
         tableView.layer.cornerRadius = 15//set corner radius here
    
        matchfixtureViewModel.fetchMatchDetails {
            self.tableView.reloadData()
        }}
}

extension MatchFixtureViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchfixtureViewModel.matchData.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchFixtureTableViewCell", for: indexPath) as! MatchFixtureTableViewCell
        let detailsOfMatch = matchfixtureViewModel.matchData[indexPath.row]
        teamHome = detailsOfMatch.matchdetail?.teamHome ?? "0"
        teamAway = detailsOfMatch.matchdetail?.teamAway ?? "0"
        if  let _teamHome = teamHome,
            let _teamAway = teamAway {
            cell.teamALbl.text = detailsOfMatch.teams?[_teamAway]?.nameFull ?? "Team One"
            cell.teamBLbl.text = detailsOfMatch.teams?[_teamHome]?.nameFull ?? "Team Two"
            cell.timeVenueLbl.text = detailsOfMatch.matchdetail?.venue?.name ?? ""
            cell.timeLabel.text = detailsOfMatch.matchdetail?.match?.time ?? ""
            cell.dateLabel.text = detailsOfMatch.matchdetail?.match?.date ?? ""
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        125
    }
   
    
}
extension MatchFixtureViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsOfMatch = matchfixtureViewModel.matchData[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MatchDetailsViewController") as! MatchDetailsViewController
        vc.matchdetailsviewmodel = MatchDetailsViewModel(matchData: detailsOfMatch)
        vc.teamHome = detailsOfMatch.matchdetail?.teamHome ?? "0"
        vc.teamAway = detailsOfMatch.matchdetail?.teamAway ?? "0"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}









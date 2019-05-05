//
//  TodayViewController.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/4.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController, StoryboardInit {

    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    var proposals = [Proposal]()
   
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupUI()
        
        prepareProposals()
    }
}

private extension DiscoveryViewController {
    
    func setupUI() {
        
        // MARK: - Navigation
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "New Proposals"
        
        // MARK: - TableView
        
        tableView.register(
            UINib(nibName: "BillCell", bundle: nil),
            forCellReuseIdentifier: "BillCell"
        )
        
        tableView.estimatedRowHeight = 320
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
    }
}

extension DiscoveryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return proposals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            proposals.count > indexPath.row,
            let cell = tableView.dequeueReusableCell(withIdentifier: "BillCell", for: indexPath) as? BillCell
        else {
            
            return UITableViewCell()
        }
        
        let proposal = proposals[indexPath.row]
        
        cell.setup(with: proposal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        present(DetailViewController.storyboardInit(), animated: true)
    }
}

private extension DiscoveryViewController {
    
    func prepareProposals() {
        
        var proposal1 = Proposal(
            id: 1,
            title: "Ban the street-smoking and build smoking room on the street!",
            description: "result of widely implemented street smoking bans, the numbers of places where people are allowed to smoke has been reduced. As of October 2012, there were three designated smoking rooms (DSRs) in the streets. The leakage of environmental tobacco smoke (ETS) has been widely studied and it has been confirmed that DSRs, whether ventilated or nor and whether equipped with filtration systems or not, do not protect from exposure to SHS.",
            details: "Both smokers and non-smokers are satisfied and the cigarette butts can be collected properly",
            voters: 4238,
            statue: .check,
            category: .urban,
            startDate: (Date() - (5*24*60*60)),
            response: nil,
            location: "Prague",
            lat: nil,
            lng: nil,
            imageName: "demo_proposal"
        )
        
        var proposal2 = Proposal(
            id: 2,
            title: "Community and leisure center with facilities for Kraví hora",
            description: "",
            details: "",
            voters: 3589,
            statue: .check,
            category: .hygiene,
            startDate: (Date() - (44*24*60*60)),
            response: nil,
            location: "Brno-střed",
            lat: nil,
            lng: nil,
            imageName: "demo_proposal2"
        )
        
        proposals = [proposal2, proposal1, proposal2, proposal2, proposal2]
    }
}

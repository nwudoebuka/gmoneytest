//
//  FixtureViewController.swift
//  GoMoneyTest
//
//  Created by Chukwuebuka Nwudo on 03/11/2021.
//

import UIKit

class FixtureViewController: BaseViewController {
    private let fixtureTableView : UITableView = {
         let fixtureTableView = UITableView()
        fixtureTableView.register(FixtureTableViewCell.self, forCellReuseIdentifier: FixtureTableViewCell.identifier)
        fixtureTableView.tableFooterView = UIView()
        fixtureTableView.backgroundColor = .clear
         return fixtureTableView
     }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let parentTabBar = tabBarController as! DashboardViewController
        parentTabBar.setNavBarTitle("Today's Fixtures")
    }
    override func initView() {
        view.backgroundColor = .white
        fixtureTableView.delegate = self
        fixtureTableView.dataSource = self
        view.addSubview(fixtureTableView)
        fixtureTableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,padding: UIEdgeInsets(top: 20, left: 0, bottom: 100, right: 0))
        fixtureTableView.reloadData()
    }
    
}


extension  FixtureViewController:UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print("cell seen")
        let cellFixture = fixtureTableView.dequeueReusableCell(withIdentifier: FixtureTableViewCell.identifier) as! FixtureTableViewCell
        cellFixture.selectionStyle = .none
        cellFixture.contentView.isUserInteractionEnabled = false
        cellFixture.configure(selection:true)
        return cellFixture
    
        
    }


    
}

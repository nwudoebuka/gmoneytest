//
//  CompetitionViewController.swift
//  GoMoneyTest
//
//  Created by Chukwuebuka Nwudo on 03/11/2021.
//

import UIKit
import RxCocoa
import RxSwift

class CompetitionViewController: BaseViewController {
    private var viewModel = CompetitionViewModel()
    private var disposeBag = DisposeBag()
    private var listOfCompetitions:[Competition] = [Competition]()
    private let competetionTableView : UITableView = {
         let competetionTableView = UITableView()
        competetionTableView.register(CompetetionTableViewCell.self, forCellReuseIdentifier: CompetetionTableViewCell.identifier)
        competetionTableView.tableFooterView = UIView()
        competetionTableView.backgroundColor = .clear
         return competetionTableView
     }()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.competitions.subscribe({
            print("competitions on view is \($0.element?.competitions)")
            self.listOfCompetitions = $0.element!.competitions
            self.competetionTableView.reloadData()
        })
        .disposed(by: disposeBag)
    }

    override func viewDidAppear(_ animated: Bool) {
        let parentTabBar = tabBarController as! DashboardViewController
        parentTabBar.setNavBarTitle("Competition")
        viewModel.getCompetition()
    }
    override func initView() {
        view.backgroundColor = .white
        competetionTableView.delegate = self
        competetionTableView.dataSource = self
        view.addSubview(competetionTableView)
        competetionTableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,padding: UIEdgeInsets(top: 20, left: 0, bottom: 100, right: 0))
        competetionTableView.reloadData()
    }
 

}
extension  CompetitionViewController:UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCompetitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print("cell seen")
        let cellCompetition = competetionTableView.dequeueReusableCell(withIdentifier: CompetetionTableViewCell.identifier) as! CompetetionTableViewCell
        cellCompetition.selectionStyle = .none
        cellCompetition.contentView.isUserInteractionEnabled = false
        cellCompetition.configure(data: listOfCompetitions[indexPath.row])
        return cellCompetition
     }


    
}

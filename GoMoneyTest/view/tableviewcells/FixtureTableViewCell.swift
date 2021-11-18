//
//  FixtureTableViewCell.swift
//  GoMoneyTest
//
//  Created by Chukwuebuka Nwudo on 05/11/2021.
//

import UIKit

class FixtureTableViewCell: UITableViewCell {
    static let identifier = "cellFixtureIdentifier"
    lazy var timedLbl:UILabel =  {
        let timedLbl = labelBold(text: "TIMED",textSize: 14,textColor:  .black)
        return timedLbl
    }()
    lazy var timedVal:UILabel =  {
        let timedVal = labelBold(text: "13:00",textSize: 18,textColor:  .black)
        return timedVal
    }()
    lazy var halfTimeLbl:UILabel =  {
        let halfTimeLbl = labelBold(text: "00'",textSize: 12,textColor:  .gray.withAlphaComponent(0.7))
        return halfTimeLbl
    }()
    lazy var mdLbl:UILabel =  {
        let mdLbl = labelBold(text: "MD:9",textSize: 12,textColor:  .gray.withAlphaComponent(0.7))
        return mdLbl
    }()
    lazy var scoreOneLbl:UILabel =  {
        let scoreOneLbl = labelBold(text: "1",textSize: 18,textColor:  .black)
        return scoreOneLbl
    }()
    lazy var scoreTwoLbl:UILabel =  {
        let scoreTwoLbl = labelBold(text: "0",textSize: 18,textColor:  .black)
        return scoreTwoLbl
    }()
    lazy var teamOne:UILabel =  {
        let teamOne = labelBold(text: "ManChester United",textSize: 18,textColor:  .black)
        return teamOne
    }()
    lazy var teamTwo:UILabel =  {
        let teamOne = labelBold(text: "Chelsea",textSize: 18,textColor:  .black)
        return teamOne
    }()
    lazy var timeStackV:UIStackView = {
        let timeStackV = generateStackView(axis: .vertical)
        timeStackV.distribution = .fillEqually
        timeStackV.addArrangedSubview(timedLbl)
        timeStackV.addArrangedSubview(timedVal)
        timeStackV.addArrangedSubview(mdLbl)
        return timeStackV
    }()
    lazy var mainVH:UIView = {
        let mainVH = UIView()
        mainVH.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return mainVH
    }()
    var languageLbl:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:\(coder)) has not been implemented")
    }

    private func setUpView(){
        backgroundColor = .clear
        addSubview(mainVH)
        mainVH.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        mainVH.addSubview(timeStackV)
        timeStackV.anchor(top: mainVH.topAnchor, leading: mainVH.leadingAnchor, bottom: mainVH.bottomAnchor, trailing: nil,padding: UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 0))
        mainVH.addSubview(teamOne)
        teamOne.anchor(top: mainVH.topAnchor, leading: timeStackV.trailingAnchor, bottom: nil, trailing: nil,padding: UIEdgeInsets(top: 12, left: 20, bottom: 0, right: 0   ))
        mainVH.addSubview(teamTwo)
        teamTwo.anchor(top: nil, leading: timeStackV.trailingAnchor, bottom: mainVH.bottomAnchor, trailing: nil,padding: UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 0   ))
        mainVH.addSubview(scoreOneLbl)
        scoreOneLbl.anchor(top: mainVH.topAnchor, leading: nil, bottom: nil, trailing: mainVH.trailingAnchor,padding: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 20))
        mainVH.addSubview(scoreTwoLbl)
        scoreTwoLbl.anchor(top: nil, leading: nil, bottom:mainVH.bottomAnchor, trailing: mainVH.trailingAnchor,padding: UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 20))
        mainVH.addSubview(halfTimeLbl)
        halfTimeLbl.centerYAnchor.constraint(equalTo: mainVH.centerYAnchor).isActive = true
        halfTimeLbl.anchor(top: nil, leading: nil, bottom:nil, trailing: mainVH.trailingAnchor,padding: UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 50))
        
    }
    
    func configure(selection:Bool){
        
    }

}

//
//  CompetetionTableViewCell.swift
//  GoMoneyTest
//
//  Created by Chukwuebuka Nwudo on 05/11/2021.
//

import UIKit

class CompetetionTableViewCell:UITableViewCell {
    static let identifier = "cellCompetitionIdentifier"
    lazy var mainVH:UIView = {
        let mainVH = UIView()
        mainVH.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return mainVH
    }()
    lazy var rightChevronIcon:UIImageView = {
        let rightChevronIcon = UIImageView()
        rightChevronIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        rightChevronIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        rightChevronIcon.image = UIImage(named: "ic_right_chevron")
        return rightChevronIcon
    }()
    lazy var competitionLbl:UILabel = {
        let competitionLbl = labelRegular(text: "Euefa Champions League",textSize: 13,textColor: .black)
        competitionLbl.textAlignment = .left
        return competitionLbl
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
        mainVH.addSubview(rightChevronIcon)
        rightChevronIcon.anchor(top: nil, leading: nil, bottom: nil, trailing: mainVH.trailingAnchor,padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20))
        rightChevronIcon.centerYAnchor.constraint(equalTo: mainVH.centerYAnchor).isActive = true
        mainVH.addSubview(competitionLbl)
        competitionLbl.anchor(top: nil, leading: mainVH.leadingAnchor, bottom: nil, trailing:mainVH.trailingAnchor,padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 80))
        competitionLbl.centerYAnchor.constraint(equalTo: mainVH.centerYAnchor).isActive = true
    }
    func configure(data:Competition){
        competitionLbl.text = data.name
    }

}

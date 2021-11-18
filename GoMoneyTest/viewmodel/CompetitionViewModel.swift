//
//  CompetitionViewModel.swift
//  GoMoneyTest
//
//  Created by Chukwuebuka Nwudo on 14/11/2021.
//

import Foundation
import RxSwift
import RxCocoa


class CompetitionViewModel {
    private let  service = Service()
    private let disposeBag = DisposeBag()
    var errorValue = PublishSubject<Error>()
    var competitions = PublishSubject<CompetetionDTO>()
    
    func getCompetition(){
        service.getCompetitions().subscribe(
        
            onNext: {
                competitions in
                self.competitions.onNext(competitions)
            }, onError: {
                error in
                print("google location error is \(error)")
                self.errorValue.onNext(error)
            }
        ).disposed(by: disposeBag)
    }

}


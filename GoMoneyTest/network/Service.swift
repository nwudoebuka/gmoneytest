//
//  Service().swift
//  GoMoneyTest
//
//  Created by Chukwuebuka Nwudo on 14/11/2021.
//

import Foundation
import Foundation
import Alamofire
import RxSwift
import RxCocoa
class Service{
   
    func getCompetitions() -> Observable<CompetetionDTO> {
        return Observable.create { observer -> Disposable in
            let requestURl = Constants.BASE_URL+"competitions/"
        print("pharmacy drug url is \(requestURl)")
        AF.request(requestURl, method: .get).responseJSON{ responseData in
                    
            switch responseData.result {
                         case .success:
                             print("before call is ")
                            guard let data = responseData.data else{
                                observer.onError(responseData.error ?? FailureReason.notFound)
                                return
                            }
                            do{
                                let competitionResp = try JSONDecoder().decode( CompetetionDTO.self, from: data)
                              
                                print("competition resp is \(competitionResp)")
                                observer.onNext(competitionResp)
                            }catch{
                                observer.onError(error)
                            }
                            
                            
                         case .failure(let error):
                             if let statusCode = responseData.response?.statusCode,
                                 let reason = FailureReason(rawValue: statusCode)
                             {
                             observer.onError(reason)
                             }
                             observer.onError(error)
                         }
            
           
        }
            return Disposables.create()
        //print("REQUEST = \(request)")
    }
    }
    
}

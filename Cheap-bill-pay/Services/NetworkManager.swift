//
//  NetworkManager.swift
//  Cheap-bill-pay
//
//  Created by Fernando Obregon on 06/04/2023.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    var nextPayments:[NextPayModel]?
    
    func fetchNextPayments(completion: @escaping (Array<NextPayModel>?) -> Void){
        AF.request("https://api.feernandooff.com/api/collections/next_payments/records").responseDecodable(of: NextPaymentsResponse.self, completionHandler: { response in
            if let decodedData = response.value {
                    completion(decodedData.items)
                } else {
                  completion(nil)
            }
        })
        
    }
}



struct NextPaymentsResponse:Decodable {
    let page: Int
    let perPage:Int
    let items: [NextPayModel]
    
}

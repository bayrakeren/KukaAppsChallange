//
//  ServiceManager.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Moya

typealias APIResult<T> = Result<T, MoyaError>

class ServiceManager: NSObject {
    
    var constants: ServiceConstantsProtocol!
        
    init(constants: ServiceConstantsProtocol) {
        self.constants = constants
    }
    
    func constructServiceURL(endpoint: String) -> String {
        return self.constants.apiURL + endpoint
    }
    
    func fetch<M: Decodable, T: TargetType>(target: T,
                                         completion: @escaping (_ result: APIResult<M>) -> Void ) {
  
        let provider = MoyaProvider<T>(manager: DefaultAlamofireManager.sharedManager)
        
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                do {
                    let filteredResponse = try response.filter(statusCodes: 200..<400)
                    let mappedResponse = try filteredResponse.map(M.self,
                                                                  atKeyPath: nil,
                                                                  using: JSONDecoder(),
                                                                  failsOnEmptyData: false)
                    
                    
                    completion(.success(mappedResponse))
                } catch MoyaError.statusCode(let response) {
                    if response.statusCode == 401 {
                        // Refresh Token
                    }
                    completion(.failure(MoyaError.statusCode(response)))
                } catch let error {
                    debugPrint("##ERROR parsing##: \(error.localizedDescription)")
                    let moyaError = MoyaError.requestMapping(error.localizedDescription)
                    completion(.failure(moyaError))
                }
            case .failure(let error):
                debugPrint("##ERROR service:## \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
}

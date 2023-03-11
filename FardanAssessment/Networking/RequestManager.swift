//
//  RequestManager.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import Foundation
import Combine

class RequestManager {
    
    static let shared = RequestManager()
    
    private func request<T: Decodable>(data: RequestData) -> AnyPublisher<T, Error> {
        guard let componentRequest = data.urlRequest else {
            let error = NSError(domain: "Something went wrong with URL", code: -10001, userInfo: nil)
            return Fail(error: error).eraseToAnyPublisher()
        }
        return URLSession.shared
            .dataTaskPublisher(for: componentRequest)
            .tryCompactMap { result in
                try JSONDecoder().decode(T.self, from: result.data)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func login<T: Decodable>(params: [String: Any]) -> AnyPublisher<T, Error> {
        self.request(data: .init(path: .login, params: params, httpMethod: .post))
    }
}

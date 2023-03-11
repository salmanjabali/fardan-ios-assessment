//
//  LoginVM.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import Foundation
import Combine

class LoginVM: ObservableObject {
    
    var RM: RequestManager = RequestManager.shared
    var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    var sharedInstace = SharedManager.instance
    
    @Published var isloggedIn = false
        
    func login(params: [String: Any]) {
        (RM.login(params: params) as AnyPublisher<MappableObject<LoginModel.Response>, Error>)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.requestErrorHandler(completion)
            }, receiveValue: { decodable in
                if decodable.status, let decodableResponse = decodable.response {
                    self.updateResponse(decodableResponse)
                } else {
                    print("Incorrect Login: \(decodable.message)")
                }
            })
            .store(in: &cancellable)
    }
    
    func updateResponse(_ response: LoginModel.Response) {
        self.isloggedIn = true
        sharedInstace.authToken = response.token
        sharedInstace.isLoggedIn = true
    }
    
}

private extension LoginVM {
    
    func requestErrorHandler(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .failure(let error):
            print("Some error occured: \(error)")
        default:
            break
        }
    }
}


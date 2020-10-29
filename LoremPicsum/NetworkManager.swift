//
//  NetworkManager.swift
//  LoremPicsum
//
//  Created by Field Employee on 10/27/20.
//

import UIKit

final class NetworkManager {
    static var shared = NetworkManager()
    
    let session: URLSession
    let myUrl = "https://picsum.photos/100"
    
    private init(session: URLSession = URLSession.shared){
        self.session = session
    }
}

extension NetworkManager {
    
    func fetchImage(completion: @escaping (UIImage?, String?) -> ()) {
        guard let url = URL(string: myUrl) else {completion(nil, nil)
            return
        }
        session.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(nil, nil)
                return
            }
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            var id: String?
            if let result = response as? HTTPURLResponse {
                id = result.value(forHTTPHeaderField: "picsum-id")
            }
            
            completion(UIImage(data: data), id)
            return
        }.resume()
    }
}

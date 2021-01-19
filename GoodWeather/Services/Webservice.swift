//
//  Webservice.swift
//  GoodWeather
//
//  Created by Hwi kang on 2021/01/19.
//

import Foundation

//T 타입을 리퀘스트함
struct Resource<T> {
    let url : URL
    let parse : (Data) -> T
}


final class Webservice{
    func load<T>(resource:Resource<T> , completion : @escaping(T?) -> Void ){
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
            if let data = data {
                print(data)
                DispatchQueue.main.async {
                    completion(resource.parse(data))

                }
            }else{
                DispatchQueue.main.async {
                    completion(nil)

                }
            }
        }.resume()
    }
}

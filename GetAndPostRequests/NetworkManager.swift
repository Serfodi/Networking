//
//  NetworkManager.swift
//  GetAndPostRequests
//
//  Created by Сергей Насыбуллин on 15.08.2023.
//

import UIKit


class NetworkManager {
    
    static func getRequest(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response, let data = data else { return }
            print(response)
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
    static func postRequest(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        let userData = ["Curse":"Networking", "Leeson":"GET and POST Requests"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData) else { return }
        
        request.httpBody = httpBody
        
        let sessin = URLSession.shared
        sessin.dataTask(with: request) { (data, response, error) in
            
            guard let response = response, let data = data else { return }
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    static func downloadImage(url: String, complition: @escaping (_ image: UIImage)->()) {
        
        guard let url = URL(string: url)
        else { return }
        
        // Создания ссесия синглтон
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    complition(image)
                }
            }
        }.resume()
        
    }
    
    static func fetchData(url: String, complition: @escaping (_ courses: [Course])->()) {
        //        let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_course"
        //        let jsonUrlString  = "https://swiftbook.ru/wp-content/uploads/api/api_website_description"
        //        let jsonUrlString  = "https://swiftbook.ru/wp-content/uploads/api/api_missing_or_wrong_fields"
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                complition(courses)
            } catch let error {
                print("Error serialization json", error)
            }
        }.resume()
    }
    
    
    static func uploadImage(url: String) {
        let image = UIImage(named: "imageFlows")!
        
        let httpHeaders = ["Authorization" : "Client-ID 61e0f46ccb127c3"]
        
        guard let imageProperties = ImageProperties(withImage: image, forKey: "image") else { return }
        
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = httpHeaders
        request.httpBody = imageProperties.data
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
}

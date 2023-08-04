//
//  ViewController.swift
//  GetAndPostRequests
//
//  Created by Сергей Насыбуллин on 04.08.2023.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRequest(_ sender: UIButton) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
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
    
    @IBAction func postRequest(_ sender: Any) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
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
    
    
}


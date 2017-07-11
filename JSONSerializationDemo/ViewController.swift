//
//  ViewController.swift
//  JSONSerializationDemo
//
//  Created by mac on 11/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_GET(_ sender: Any) {
        let urlstring = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlstring) else  {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response{
                print("RESPONSE = \(response)")
            }
            if let data = data{
                print("DATA = \(data)")
                do
                {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("JSON = \(json)")
                }
                catch
                {
                    print(error)
                }
                
            }
        }.resume()        
    }
    
    @IBAction func btn_POST(_ sender: Any) {
        let parameter = ["username":"@kilo_loco","tweet":"HelloWorld"]
        
        let urlstring = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlstring) else  {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response{
                print("RESPONSE = \(response)")
            }
            if let data = data{
                print("DATA = \(data)")
                do
                {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("JSON = \(json)")
                }
                catch
                {
                    print(error)
                }
                
            }
        }.resume()
    }
}


//
//  PracticeSessionDataLoader.swift
//  FretelloCodingChallenge
//
//  Created by Chioma Mmegwa on 28/01/2021.
//

import UIKit

class DataLoader {
    
    var getDataDelegate: PracticeSessionProtocol?
    
    func getData() {
        let urlString = "http://codingtest.fretello.com:3000/data/sessions.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            var result: [WelcomeElement]?
            do {
                result = try JSONDecoder().decode([WelcomeElement].self, from: data)
                self.getDataDelegate?.getData(sessionData: result ?? [])
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
        }.resume()
    }
}

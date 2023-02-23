//
//  SearchModel.swift
//  YouTubeDataAPI-IOS
//
//  Created by Michael Burlingame on 1/14/23.
//

import Foundation

class SearchModel {
    
    func searchForVideos(completion: @escaping (SearchResults) -> ()) {
                
        // Create URL object
        
        let url = URL(string: Constants.SEARCH_API_URL)
        
        guard url != nil else { return }
        
        // Get URLSession object
        
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data == nil {
                return
            }
            
            // Parsing Data To Video Objects
            
            do {
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                let response = try decoder.decode(SearchResults.self, from: data!)
                
               //dump(response)
                
                DispatchQueue.main.async {
                    completion(response)
                }
                
                
            } catch {
                
                print(error)
                
            }
        }
        
        //Start task
        
        dataTask.resume()
        
    }
}

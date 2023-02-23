//
//  SearchResults.swift
//  YouTubeDataAPI-IOS
//
//  Created by Michael Burlingame on 1/14/23.
//

import Foundation

struct SearchResults: Decodable {
    
    var items: [SearchVideo]?
    
    enum CodingKeys:String, CodingKey {
        
        case items
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([SearchVideo].self, forKey: .items)
    }
    
}

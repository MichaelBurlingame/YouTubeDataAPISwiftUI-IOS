//
//  SearchVideo.swift
//  YouTubeDataAPI-IOS
//
//  Created by Michael Burlingame on 1/14/23.
//

import Foundation

struct SearchVideo : Decodable {
    
    var videoId = ""
    var title = ""
    var thumbnail = ""
    var published = Date()
    var channelTitle = ""
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case id
        case thumbnails
        case high
        
        case videoId
        case title
        case channelTitle
        case thumbnail = "url"
        case published = "publishedAt"
        
    }
    
    init(from decoder: Decoder) throws {
        
        // Create Main Container

        let container = try decoder.container(keyedBy: CodingKeys.self)
        
            // Create ID Container
        
            let idContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .id)
        
                // Parse VideoID
        
                self.videoId = try idContainer.decode(String.self, forKey: .videoId)
               
            // Snippet Container
        
            let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
                // Parse title
        
                self.title = try snippetContainer.decode(String.self, forKey: .title)
        
                // Parse Channel Name
        
                self.channelTitle = try snippetContainer.decode(String.self, forKey: .channelTitle)
        
                // Parse publish date
        
                self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
                // Create Thumbnail Container
        
                let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
    
                    // Create HD Thumbnail container
        
                    let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
                        // Parse Thumbnail
        
                        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
    }
}

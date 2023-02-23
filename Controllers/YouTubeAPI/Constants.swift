//
//  Constants.swift
//  YouTubeDataAPI-IOS
//
//  Created by Michael Burlingame on 1/14/23.
//

import Foundation

struct Constants {
    
    static var API_KEY = "[INSERT_API_KEY]"
 
    static var SEARCH_API_URL = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=\(Constants.QUERY)&type=video&key=\(Constants.API_KEY)"

    static var QUERY = ""
    
}



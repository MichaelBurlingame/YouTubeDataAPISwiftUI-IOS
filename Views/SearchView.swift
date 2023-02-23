import SwiftUI

struct SearchView: View {
    
    @State var searchQuery = Constants.QUERY
    @State var response: SearchResults?
    var model = SearchModel()
    
    
    var body: some View {
        
        NavigationView {
            
            if response?.items?.count != nil {
                
                ResultList(response: response)
                
            } else {
                
                ZStack {
                    
                    VStack {
                        
                        Image(systemName: "magnifyingglass")
                            .scaleEffect(5)
                            .padding(20)
                        
                        Text("Search")
                            .foregroundColor(.gray)
                            .font(.system(size: 30,
                                          weight: .light,
                                          design: .rounded))
                            .padding(20)
                        
                    }
                }
            }
        }
        .searchable(text: $searchQuery)
        .onSubmit(of: .search) {
            
            let searchFor = searchQuery.removeWhitespace()
            
            DispatchQueue.main.async {
                
                response = nil

                Constants.QUERY = searchFor
                
                Constants.SEARCH_API_URL = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=\(Constants.QUERY)&type=video&key=\(Constants.API_KEY)"
                
                model.searchForVideos { res in
                    
                    self.response = res
                    
                }
            }
        }
    }
}

struct ResultList: View {
    
    @State var response: SearchResults?
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
            
            ZStack {
                
                List(0..<10) { id in
                    
                    HStack {
                        
                        AsyncImage(url: URL(string: response?.items?[id].thumbnail ?? "")) { image in
                            
                            image.resizable()
                            
                        } placeholder: {
                            Text("")
                        }
                        .frame(width: screenWidth / 2.5,
                               height: screenHeight / 8)
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        
                        Spacer()
                        
                        VStack {
                            
                            Text(response?.items?[id].title.replaceOddChars() ?? "")
                                .padding(.top, 2)
                                .lineLimit(2)
                                .frame(width: screenWidth * 0.45)
                                .font(.system(size: 17,
                                              weight: .medium,
                                              design: .rounded))
                                .multilineTextAlignment(.center)
                            
                            Rectangle()
                                .frame(maxWidth: screenWidth, maxHeight: 1)
                                .foregroundColor(Color.gray.opacity(0.20))
                            
                            Text(response?.items?[id].channelTitle ?? "")
                                .padding(.top, 2)
                                .lineLimit(1)
                                .font(.system(size: 12,
                                              weight: .regular,
                                              design: .default))
                            
                            NavigationLink(destination: VideoPlayer(videoID: response?.items?[id].videoId ?? ""), label: { Text("") })
                                .frame(maxHeight: 1)
                            
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            
                            // PlayList Add
                            
                        } label: {
                            Label("Add", systemImage: "plus")
                        }
                        .tint(.teal)
                    }
                    .frame(height: screenHeight / 8)
                }
                .scrollContentBackground(.hidden)
            }
        }
    
}

extension String {
    
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }

    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "+")
    }
    
    func replaceOddChars() -> String {
        return self.replace(string: "&#39;", replacement: "'")
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

import SwiftUI

struct StartView: View {
    
    var model = SearchModel()
    
    var body: some View {
        
        TabView {
            
            // Tabs Are Used As Placeholders For Future Expansion
            // Each Should Go To It's Own View Eventually
            
            PlaceHolderView()
                .tabItem {
                    VStack {
                        Label("Featured", systemImage: "star")
                        
                        Text("Featured")
                    }
                }
            
            SearchView()
                .tabItem {
                    VStack {
                        Label("Search", systemImage: "magnifyingglass")
                            .foregroundColor(.white)
                        
                        Text("Editor")
                            .foregroundColor(.white)
                    }
                }
            
            PlaceHolderView()
                .tabItem {
                    VStack {
                        Label("Playlists", systemImage: "music.note.list")
                        
                        Text("Playlists")
                    }
                }
            
        }
    }
}

struct PlaceHolderView: View {
    var body: some View {
        VStack {
            Text("Not Finished...")
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

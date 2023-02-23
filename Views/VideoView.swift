import SwiftUI

struct VideoView: View {
    
    var id: String
    
    var body: some View {
        
        VideoPlayer(videoID: id)
            .frame(maxHeight: UIScreen.main.bounds.height * 0.45)
            .cornerRadius(15)
            .padding(.horizontal, 10)
            .preferredColorScheme(.light)

    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(id: "[INSERT_VIDEO_ID]")
    }
}

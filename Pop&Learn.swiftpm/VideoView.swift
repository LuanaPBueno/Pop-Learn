import Foundation
import SwiftUI

struct VideoView:View{
    @Environment(\.dismiss) var dismiss
    var videoToPlay:String
    
    var body: some View{
        ZStack {
            GeometryReader { geo in
                PlayerView(videoName: videoToPlay)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
            
            VStack {
                Spacer()
                HStack{
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("buttonBACK")
                    })
                    .padding()
                    .frame(alignment: .trailing)
                    .navigationBarHidden(true)
                    Spacer()
                    Spacer()
                    
                    NavigationLink(destination: ThirdView(videoToPlay: videoToPlay)) {
                        Image("buttonGO")
                    }
                    .padding()
                    .frame(alignment: .trailing) 
                    .navigationBarHidden(true)
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
}

//struct video1View_Previews: PreviewProvider {
//    static var previews: some View {
//        video1View()
//    }
//}

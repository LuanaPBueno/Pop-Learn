
import Foundation
import SwiftUI

struct FifthView:View{
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
                    
                    NavigationLink(destination: SixthView()) {
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




import Foundation
import SwiftUI


struct FourthView: View {
    @Environment(\.dismiss) var dismiss
    var videoToPlay:String
    
    let dialogs = [
        "Congratulations! Now, let's dive into popping dance and try to understand the movement(s) you just saw and did.",
        "Linked with funk and hip hop, Popping Dance involves rapid movements and contractions focusing on your muscles. Key elements include precise muscle isolation.  ",
        "Now, go to the Next Page, watch the video again and try again focusing on the movement and contractions of the muscles of your body."
    ]
    @State var dialogIndex = 0
    
    var currentDialog:String {dialogs[dialogIndex]}
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("page")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear() {
                        _ = UIImage(named: "page")
                    }
                
                VStack {
                    Text(currentDialog)
                        .font(.custom("Avenir-Heavy", size: 28))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color("blue"))
                        .cornerRadius(15)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                        .frame(maxWidth: 700) 
                        .offset(y: 285)
                    
                    
                    VStack {
                        Spacer()
                        HStack{
                            Button(action: {
                                if dialogIndex > 0 {
                                    dialogIndex -= 1
                                } else {
                                    dismiss()
                                }
                            }, label: {
                                Image("buttonBACK")
                            })
                            .padding()
                            .frame(alignment: .trailing)
                            .navigationBarHidden(true)
                            Spacer()
                            Spacer()
                            
                            Group {
                                if dialogIndex < dialogs.count-1 {
                                    Button {
                                        dialogIndex += 1
                                    } label: {
                                        Image("buttonGO")
                                    }
                                } else {
                                    
                                    NavigationLink(destination: FifthView(videoToPlay: videoToPlay)) {
                                        Image("buttonGO")
                                    }
                                    .navigationBarHidden(true)
                                }
                            }
                            .padding()
                            .frame(alignment: .trailing) 
                            
                            
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                }
            }
            .navigationBarHidden(true)
        }
    }
}




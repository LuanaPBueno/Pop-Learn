import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(1)
        
            VStack {
                NavigationStack {
                    Text("Choose a movement for you to learn and try to copy it in the next page.")
                        .font(.custom("Avenir-Heavy", size: 28))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color("blue"))
                        .cornerRadius(15)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                        .frame(maxWidth: 700)
                    
                    Spacer()
                    VStack{
                        HStack(spacing: 50) {
                            NavigationLink(destination: VideoView(videoToPlay: "video1")) {
                                Image("video1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 300)
                            }
                            .padding()
                            
                            NavigationLink(destination: VideoView(videoToPlay: "video2")) {
                                Image("video2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 300)
                            }
                            .padding()
                        }
                        
                        HStack{
                            Spacer()
                            NavigationLink(destination: VideoView(videoToPlay: "video3")) {
                                Image("video3")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 300) 
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("buttonBACK")
                        }
                        .padding()
                        
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarHidden(true)
    }
}


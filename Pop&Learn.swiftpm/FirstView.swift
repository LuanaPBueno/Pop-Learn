import SwiftUI

struct FirstView: View {
    @State private var showAlert = true
    var body: some View {
            NavigationStack {
                ZStack {
                    Image("firstpage")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear() {
                            _ = UIImage(named: "firstpage")
                        }
                    
                    
                    Text("Pop&Learn")
                        .font(.custom("Avenir-Heavy", size: 100))
                        .foregroundColor(.white)
                        .offset(y: -280)
                        .shadow(color: .black, radius: 5, x: 0, y: 0)
                    
                    VStack {
                        Text("Hi, you were invited to a Urban Dance class. The style you will learn today is called Popping Dance. Click on 'Play' to accept this challenge. Good luck!")
                            .font(.custom("Avenir-Heavy", size: 28))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color("blue"))
                            .cornerRadius(15)
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                            .frame(maxWidth: 700) 
                            .offset(y: 285)
                    }

                    VStack {
                        Spacer()

                        NavigationLink(destination: SecondView()) {
                            Image("play")
                                .resizable()
                                .frame(width: 270, height: 130)
                        }
                    }
                }
                .navigationBarHidden(true) 
                .alert(isPresented: $showAlert) {
                            Alert(title: Text("Alert"), message: Text("Please use your device in the vertical direction."), dismissButton: .default(Text("OK")))
                        }
            }
        }
    }


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}


struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

import Foundation
import SwiftUI

struct SeventhView: View {
    @Environment(\.dismiss) var dismiss
    
    let dialogs2 = [
        "Congratulations! If you had known what to focus on in a popping class from the beginning, would you have chosen a different emphasis?",
        "Understanding the specific details of real preparation can really help you achieve your goals. It's about figuring out what you need to do and what tools you need to do it, so you can handle challenges and take advantage of opportunities.",
        "Instead of just vaguely understanding why it's important, you'll dive deep into the process and see real benefits. Know the importance of being prepared to achieve your goals in the best possible way."
    ]
    
    @State var dialog2Index = 0
    
    var currentDialog2: String { dialogs2[dialog2Index] }
    
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
                    Text(currentDialog2)
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
                                if dialog2Index > 0 {
                                    dialog2Index -= 1
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
                                if dialog2Index < dialogs2.count - 1 {
                                    Button {
                                        dialog2Index += 1
                                    } label: {
                                        Image("buttonGO")
                                    }

                                } else {
                                    HStack{
                                    Spacer()
                                    NavigationLink(destination: FirstView()){
                                        Image("retry")
                                            .resizable()
                                            .frame(width: 300, height: 130)
                                    }
                                    .navigationBarHidden(true)
                                }
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

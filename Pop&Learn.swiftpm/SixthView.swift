import SwiftUI

struct SixthView: View {
    @State private var timerIsRunning = false
    @State private var secondsRemaining = 10
    @State private var progressValue: Double = 0.0
    @State private var prepareTimeRemaining = 5
    @State private var loadingTimeRemaining = 10
    @State private var showPrepareText = true
    @State private var showTimerButton = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("After you hit the button, you will have 5 seconds to prepare yourself, and then 10 seconds to recreate the movement of the video you just saw. Use the camera as a mirror to see yourself. Good dance!")
                .font(.title)
                .padding()
            
            ZStack {
                CameraView() 

                
                if showTimerButton {
                    Button {
                        Task {
                            startTimer()
                            showTimerButton = false
                        }
                    } label: {
                        Image("timer")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 500, height: 200)
                    }
                    .disabled(timerIsRunning)
                }
                
                if timerIsRunning && prepareTimeRemaining > 0 {
                    VStack {
                        Image("PREPARE")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 300)
                            .transition(.opacity)



                            Text("\(prepareTimeRemaining)")
                                .padding()
                                .font(.custom("Avenir-Heavy", size: 300))
                                .foregroundColor(.black)
                                .transition(.opacity)
                                .shadow(color: .gray, radius: 5, x: 0, y: 0)
                        }
                }
                
                if timerIsRunning && prepareTimeRemaining <= 0 {
                    VStack {
                        Spacer()
                        Image("DANCE")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 150)
                            .transition(.opacity)
                        
                        ProgressView("", value: progressValue, total: 1)
                            .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                            .frame(width: 550, height: 20) 
                            .animation(.linear(duration: 10), value: progressValue)
                            .onChange(of: progressValue) { newValue in
                                if newValue >= 1.0 {
                                    stopTimer()
                                }
                            }
                        Text(" ")


                        
                    }
                }
                HStack{
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("buttonBACK")
                    })
                    Spacer()
                }
                if !timerIsRunning && prepareTimeRemaining <= 0 && loadingTimeRemaining <= 0 {
                    HStack{
                        Spacer()
                        NavigationLink(destination: SeventhView()) {
                            Image("buttonGO")
                        }
                    }
                }
            }

        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            if timerIsRunning {
                if prepareTimeRemaining > 0 {
                    prepareTimeRemaining -= 1
                    showPrepareText = true
                } else if loadingTimeRemaining > 0 {
                    loadingTimeRemaining -= 1
                    progressValue = 1.0 - (Double(loadingTimeRemaining) / 10.0)
                    showPrepareText = false
                } else if secondsRemaining > 0 {
                    secondsRemaining -= 1
                }
            }
        })
        .navigationBarHidden(true)
    }
      
    
    private func startTimer() {
        timerIsRunning = true
        prepareTimeRemaining = 5
        loadingTimeRemaining = 10
        secondsRemaining = 10
        progressValue = 0.0
        showPrepareText = true
    }
    
    private func stopTimer() {
        timerIsRunning = false
    }
}

struct SixthView_Previews: PreviewProvider {
    static var previews: some View {
        SixthView()
    }
}

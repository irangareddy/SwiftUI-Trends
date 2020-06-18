import SwiftUI
// Using AVKit, because we are playing audio on LongTap Gesture
import AVKit
import PlaygroundSupport


// MARK:- LongpressGestureView


public struct LongpressGestureView: View {
    public init() {}
    
//    What is @GestureState ?
//    GestureState is a property wrapper that works only with gestures. It’s responsible for updating the property value of the state as the gesture changes and resetting it to the initial value once the gesture finishes.
//    GestureState is an immutable property, unlike State.
    
    @GestureState private var didLongPress: Bool = false
    @State var player: AVAudioPlayer!
  
        public var body: some View {
            
            Image(uiImage: #imageLiteral(resourceName: "car.jpeg"))
            .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 500, alignment: .center)
                .scaleEffect(didLongPress ? 1.2 : 1)
            .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.4), radius: 20, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.4), radius: 20, x: -10, y: -10)
                .overlay(VStack {
                        Text(didLongPress ? "READY TO RACE" : "")
                             .bold()
                            .foregroundColor(.white)
                            .opacity(0.8)
                            .font(.system(size: 20))
                   
      
                    Spacer()
                    }.padding(20))
//                 On LongPress Gesture play the audio with minimum duration of 2.0
                .gesture(LongPressGesture(minimumDuration: 2.0)
//                  Playing Audio
                    .onChanged({ _ in
                        self.player.play()
                    })
//                    Stopping Audio
                    .onEnded({ _ in
                        self.player.stop()
                    })
                    
                .updating($didLongPress) { value, state, transcation in
                    state = value
                    
                    
                    
                })
                .animation(.easeInOut)
                .onAppear() {
                    let url  = Bundle.main.path(forResource: "caraudio", ofType: ".mp3")
                    self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            }
                //            InLine Navigation Header
            .navigationBarTitle(Text("Longpress Gesture"),displayMode: .inline)
    }
    }


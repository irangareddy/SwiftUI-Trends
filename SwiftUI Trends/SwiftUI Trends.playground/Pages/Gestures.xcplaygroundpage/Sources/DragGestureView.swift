
import SwiftUI
import AVKit
import PlaygroundSupport

// MARK:- DragGestureView


// Recalling playing audio onChanged

public struct DragGestureView: View {
    public init() {}
    
    @State var show = false
    @State var viewState = CGSize.zero
     @State var player: AVAudioPlayer!
    
    public var body: some View {
        ZStack {
            Image(uiImage: #imageLiteral(resourceName: "snake.jpg"))
            .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
            
                .shadow(color: Color.black.opacity(0.4), radius: 20, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.4), radius: 20, x: -10, y: -10)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .frame(width: 350, height: 200, alignment: .center)
                .animation(.spring())
                .onTapGesture {
                   self.show.toggle()
                }
//                on Drag Gesture perfroming action
                .gesture(
                   DragGesture()
                      .onChanged { value in
                         self.viewState = value.translation
                         self.show = true
                        self.player.play()
                      }
                      .onEnded { _ in
                         self.viewState = CGSize.zero
                         self.show = false
                        self.player.stop()
                      }
                )
        }.onAppear() {
                let url  = Bundle.main.path(forResource: "snakehiss", ofType: ".mp3")
                self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        }
            //            InLine Navigation Header
        .navigationBarTitle(Text("Drag Gesture"),displayMode: .inline)
    }
}



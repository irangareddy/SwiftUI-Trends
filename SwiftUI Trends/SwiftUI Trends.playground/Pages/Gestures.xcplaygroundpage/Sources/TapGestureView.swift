
import SwiftUI
import PlaygroundSupport

public struct TapGestureView: View {
    public init() {}
    
    @State var didTap: Bool = false

    
    public var body: some View {
       
        VStack {
        
            
            ZStack {
//               Using ternary opetator
                Image(uiImage: (didTap ? #imageLiteral(resourceName: "marvel.jpeg") : #imageLiteral(resourceName: "vs.jpeg")))
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 250, height: 200, alignment: .center)
                    .shadow(color: Color.black.opacity(0.4), radius: 20, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.4), radius: 20, x: -10, y: -10)
                    .overlay(VStack() { Spacer()
                            Text(didTap ? "whatever your choice is but, we all miss him" : "or")
                                .foregroundColor(.white)
                                .font(.subheadline)
                            .bold()
                       
                        }.padding())
//                    On Tap Gesture the value is changed
                      .gesture(TapGesture()
                          .onEnded {_ in
                              self.didTap.toggle()
                          }
                      )
                    .scaleEffect(didTap ? 1.6: 1)
                    .animation(.easeOut)
                
            }
        }
//            InLine Navigation Header
        .navigationBarTitle(Text("Tap Gesture"),displayMode: .inline)
    }
}

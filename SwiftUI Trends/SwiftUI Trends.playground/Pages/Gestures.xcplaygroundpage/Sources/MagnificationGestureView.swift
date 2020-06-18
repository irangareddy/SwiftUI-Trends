import SwiftUI
import PlaygroundSupport

// MARK:- MagnificationGestureView


public struct MagnificationGestureView: View {
    public init() {}
    @State var magnificationValue: CGFloat = CGFloat(1)
    @State var rotationValue: Angle = .zero
    
    public var body: some View {
        Image(uiImage: #imageLiteral(resourceName: "globe.jpeg"))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .scaleEffect(magnificationValue)
            .rotationEffect(rotationValue)
            .frame(width: 300, height: 300, alignment: .center)
//            Changing Image on rotation and magnification value
            .gesture(MagnificationGesture()
                .onChanged { value in
                    self.magnificationValue = value
            }
            .simultaneously(with: RotationGesture().onChanged { value in
                self.rotationValue = value
            }))
            //            InLine Navigation Header
        .navigationBarTitle(Text("Magnification Gesture"),displayMode: .inline)
    }
}

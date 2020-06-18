
import SwiftUI
import PlaygroundSupport

// MARK:- AnimationView

// main view to display

public struct AnimationView: View {
    public init() {}
    
//   Recall @State
    
    @State private var selected = 0
    @State var numberOfCircles: Int = 6 
    @State var isCenter = false
    @State var isCenter2 = false
    @State private var scheme: Bool = false
    var animations: [String] = ["None","Default","EaseIn","EaseOut","EaseInOut","Linear","Spring","InteractiveSpring"]
    
    public var body: some View {
        ZStack {
            
//            Recall light and dark mode
            scheme ? Color.white : Color.black
            
            
            VStack(spacing: 100) {
                
                 TitleView(scheme: $scheme)
                
                
                
               VStack(spacing: 40) {
                           
                          
                                VStack {
//                               Using Regular picker here
                               Picker(selection: $selected, label: Text("Please choose a color")) {
                                   ForEach(0 ..< animations.count) {
                                       Text(self.animations[$0])
                                        .foregroundColor(self.scheme ? Color.black : Color.white)
                                   }
                               }.labelsHidden()
                               
                               Spacer()
                               Text("Your Animation: \(animations[selected])")
                                .foregroundColor(self.scheme ? Color.black : Color.white)
                                   .padding()
                                      .overlay(
                                          RoundedRectangle(cornerRadius: 16)
                                              .stroke(Color.pink, lineWidth: 4)
                                      )
                                   
                           }.frame(height: 100)
                           
                           
                           Spacer()
                           
                           VStack {
                               ZStack {
                                   
                                   ForEach(0..<numberOfCircles) { i in
                                       AppleWatch(numberOfCircles: self.$numberOfCircles, number: i, isCenter: self.$isCenter, isCenter2: self.$isCenter2)
                                   }
                                   
                               }.rotationEffect(.degrees(isCenter ? 360 : 0))
                                   .scaleEffect(isCenter2 ? 1 : 1/4)
//                                This is main animation for the breathing view
                                   .animation(Animation.spring().repeatForever(autoreverses: true).speed(1/10))
                                   .onAppear() {
                                       self.isCenter.toggle()
                                       self.isCenter2.toggle()
                                       
                               }
                           }
//                            Based on picker value the animation style gonna change
//                            Using Ternary Operator to manage animation in view
                           .animation(selected == 0 ?  .none : .none)
                           .animation(selected == 1 ? .default : .spring())
                           .animation(selected == 2 ? .easeIn : .spring())
                           .animation(selected == 3 ? .easeOut : .spring())
                           .animation(selected == 4 ? .easeInOut : .spring())
                           .animation(selected == 5 ? .linear : .spring())
                           .animation(selected == 6 ? Animation.spring().repeatForever(autoreverses: true).speed(1/8)  : .spring())
                           .animation(selected == 7 ? .interactiveSpring()  : .spring())
                       }.frame(height: 500)
            }
        }
    }
}

// MARK:- AppleWatch

// Creating the breathing view

public struct AppleWatch: View {
    
//    Recall Binding
    
    @Binding var numberOfCircles: Int
    @State var number: Int
    @Binding var isCenter: Bool
    @Binding var isCenter2: Bool
    
    
    public var body: some View {
        
        Group {
            
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.pink).opacity(0.25)
                    .offset(y:50)
                
                Circle()
                .frame(width: 100, height: 100)
                    .foregroundColor(.pink).opacity(0.25)
                .offset(y:-50)
            }
            
        }.rotationEffect(Angle(degrees: Double(360/numberOfCircles * number-1)))
        
        
    }
}


// MARK:- Title View

// Recall Title View

public struct TitleView: View {
    
    @Binding var scheme: Bool
    
public var body: some View {
        HStack(alignment: .center) {
            
            Spacer()
            
            VStack {
                Text("Animation")
                    .font(.largeTitle)
                    .fontWeight(.black)
                .shadow(color: Color(.black).opacity(0.3), radius: 20, x: 5, y: 5)
                .shadow(color: Color(.white).opacity(0.3), radius: 20, x: -5, y: -5)
                Text("is breathing, just feel it")
                    .font(.caption)
                .shadow(color: Color(.black).opacity(0.3), radius: 20, x: 5, y: 5)
                .shadow(color: Color(.white).opacity(0.3), radius: 20, x: -5, y: -5)
            }.foregroundColor(scheme ? Color.black : Color.white)
            
            Spacer()
            
            HStack{
                    
                       Button(action: {
                           self.scheme.toggle()
                       }) {
                           Image(systemName: scheme ?  "sun.max.fill" : "moon.stars.fill")
                               .foregroundColor(.red)
                               .frame(width: 44, height: 44)
                               .background(Color(.white))
                               .cornerRadius(30)
                            .shadow(color: Color(.black).opacity(0.3), radius: 20, x: 5, y: 5)
                        .shadow(color: Color(.white).opacity(0.3), radius: 20, x: -5, y: -5)
                       }
                   }
        }.padding(.horizontal,20)
        
        
    }
}



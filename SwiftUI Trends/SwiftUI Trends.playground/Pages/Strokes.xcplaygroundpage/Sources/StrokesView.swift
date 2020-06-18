

import SwiftUI
import PlaygroundSupport

// MARK:- ColorsExtension


// Note: We declared all structs,extension are public throughout the class for availabilty throughout the page

// I have used a color extensions because these colors were defalutly used in the entire the StrokesView

public extension Color {
    
    static func rgb(r: Double,g: Double,b: Double) -> Color{
        return Color(red: r/255, green: g/255, blue: b/255)
    }
    
    
    static let bgColor = Color.rgb(r: 21, g: 22, b: 33)
    static let outlineColor = Color.rgb(r: 54, g: 255, b: 203)
    static let trackColor = Color.rgb(r: 45, g: 56, b: 95)
    static let pulsatingColor = Color.rgb(r: 73, g: 113, b: 148)
    static let roundtop = Color(red: 0.859, green: 0.014, blue: 0.092)
    
    static let roundmiddle = Color(red: 0.618, green: 0.968, blue: -0.013)
    static let roundbottom = Color(red: 0.002, green: 0.884, blue: 0.842)
    
    
}

// MARK:- StrokesView


// This is main stroke view which gonna display

public struct StrokesView: View {
    
    // we this function in the main to preview the content
    
    public init(){}
    
    //     What is @State ?
    //     If you need a simple property that belongs to a single view you should use @State
    
    
    @State private var stroke = 2
    @State private var sliderValue: Double = 0.66
    @State private var scheme: Bool = false
    
    public var body: some View {
        ZStack {
            
            scheme ? Color.white : Color.black
            
            VStack(spacing: 40) {
                
                //                    We are passing a State value to a Binding
                TitleView(scheme: $scheme)
                
                
                
                ZStack {
                    //                    Its me here.....Add your pick if you are interested
                    Image(uiImage: #imageLiteral(resourceName: "latest.jpg"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 250, alignment: .center)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 5)
                    
                    //                    Calling RingView (Strokes)and Use these default for good profile view
                    
                    //                     To play with this remove each of the RingView and preview the playground page
                    
                    //                    Stroke 3
                    RingView(thiswidth: 397, thisheight: 397, color1: Color.roundtop, color2: Color.roundtop,startPos: stroke == 3 ? (0.99 - CGFloat(sliderValue)) : 1/8)
                    
                    
                    //                    Stroke 2
                    RingView(thiswidth: CGFloat(336), thisheight: 336, color1: Color.roundmiddle, color2: Color.roundmiddle,startPos:stroke == 2 ? (0.99 - CGFloat(sliderValue)) : 1/3)
                    //                    Stroke 1
                    RingView(thiswidth: 275, thisheight: 275, color1: Color.roundbottom, color2: Color.roundbottom,startPos: stroke == 1 ? (0.99 - CGFloat(sliderValue)) : 1/6)
                    
                    
                }.padding()
                
                
                
                VStack {
                    
                    //                    Using Picker here and giving a state value to picker inorder to obtain the current Stroke Selected
                    Picker(selection: $stroke, label: Text("Select the stroke")) {
                        Text("Stroke 1").tag(1)
                        Text("Stroke 2").tag(2)
                        Text("Stroke 3").tag(3)
                    }.pickerStyle(SegmentedPickerStyle()).background(Color.white)
                    //                    Selected SegmentedPickerStyle Because by default there is know SegmentedControl in SwiftUI
                    
                    HStack {
                        //                      Using "Slider" to change the stroke value
                        Slider(value: $sliderValue, in: 0...1)
                            .accentColor(Color.red)
                            .padding()
                        //                        Displaying the current value back to the screen
                        Text("\(sliderValue * 100, specifier: "%.0f ")%")
                            .foregroundColor(scheme ? Color.black : Color.white)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.red, lineWidth: 4)
                                    .frame(width: 100)
                        )
                            .frame(width: 100)
                        
                    }
                    
                    
                }.padding()
                
                
                
                
                
                
            }
        }
        
        
        
        
    }
}

// MARK:- RingView


public struct RingView: View {
    let thiswidth: CGFloat
    let thisheight: CGFloat
    let color1: Color
    let color2: Color
    let startPos: CGFloat
    
    @State var show = false
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .frame(width: self.thiswidth, height: self.thisheight, alignment: .center)
                
                .overlay(
                    Circle()
                        
                        .trim(from: show ? startPos : 0.99 , to: 1)
                        .stroke(LinearGradient(gradient: Gradient(colors: [color1,color2]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.degrees(90))
                        
                        .shadow(color: Color.black.opacity(0.5), radius: 20, x: 1)
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                        //                    .animation(Animation.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 2.0).repeatCount(5))
                        .animation(.spring())
                        .onAppear {
                            self.show.toggle()
                })
            
            
        }
    }
}

// MARK:- TitleView



public struct TitleView: View {
    
    //    what is @Binding?
    //    Use a binding to create a two-way connection between a view and its underlying model.
    
    //    So, the binding states for bind value back and forth and the @State using for reading and mutating the value and it provides the binding on the value it stores.
    
    @Binding var scheme: Bool
    
    public var body: some View {
        HStack(alignment: .center) {
            
            Spacer()
            
            VStack {
                Text("Strokes")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .shadow(color: Color(.black).opacity(0.3), radius: 20, x: 5, y: 5)
                    .shadow(color: Color(.white).opacity(0.3), radius: 20, x: -5, y: -5)
                Text("Make your profile beautiful")
                    .font(.caption)
                    .shadow(color: Color(.black).opacity(0.3), radius: 20, x: 5, y: 5)
                    .shadow(color: Color(.white).opacity(0.3), radius: 20, x: -5, y: -5)
            }.foregroundColor(scheme ? Color.black : Color.white)
            
            Spacer()
            //          Here were are toggle in between light and dark modes
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

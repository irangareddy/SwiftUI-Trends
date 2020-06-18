import PlaygroundSupport

import SwiftUI

// MARK:- Keyboard


// extension for keyboard to dismiss
public extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// MARK:- Color


public extension Color {
    
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
    
    static let oofBlue = Color(#colorLiteral(red: 0.2588235294, green: 0.2392156863, blue: 0.6117647059, alpha: 1))
    
    static let bluish = Color(#colorLiteral(red: 0.4237234294, green: 0.3901996315, blue: 0.9996331334, alpha: 1))
    
}

// MARK:- LinearGradient


public extension LinearGradient {
    init(_ colors: Color...){
        
        self.init(gradient: Gradient(colors: colors),startPoint: .topLeading,endPoint: .bottomTrailing)
        
    }
}

// MARK:- Custom Corners

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

// MARK:- WWDC20View


public struct WWDC20View: View {
    
    public init() {}
    
    @State var name: String = ""
    @State var showContent = false
    @State var value: CGFloat = 0
    
    public var body: some View {
        ZStack {
            Color.offWhite.edgesIgnoringSafeArea(.all)
            // what is Geomety Reader ?
            //
            //            The GeometryReader is a container view which can contain child views. The GeometryReader can use properties that positions the views within it
            
            GeometryReader { geometry in
                VStack {
                    Rectangle()
                        .fill(Color.oofBlue)
                        .cornerRadius(geometry.size.width/3, corners: [.bottomLeft, .bottomRight])
                        
                        .frame(width: geometry.size.width/1,height: geometry.size.height/1.4)
                        
                        //                    Outer Shadow
                        .shadow(color: Color.black.opacity(0.22), radius: 10, x: 10, y: 10)
                        .overlay(VStack(alignment: .center ,spacing: 10) {
                            HStack(alignment: .bottom, spacing:  0) {
                                Spacer()
                                
                                Image(uiImage: #imageLiteral(resourceName: "apple.png"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                
                                Text("WWDC20")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 34))
                                    .fontWeight(.heavy)
                                Spacer()
                            }.padding([.top],20)
                            
                            Text("Ready. Set. Code.")
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .font(.system(size: 34))
                                .fontWeight(.medium)
                                .padding([.top,.bottom],8)
                            
                            
                            Text("On June 22, WWDC20 takes off. Get ready for the first global, all-online WWDC by downloading the Apple Developer app to stay notified on all the latest news, with updates for events and sessions.")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                                .padding(.horizontal)
                            Image(uiImage: #imageLiteral(resourceName: "Techno.png"))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        })
                    Spacer()
                    
                    
                    ZStack {
                        Color.offWhite
                        VStack {
                            
                            
                            
                            HStack {
                                Image(uiImage: #imageLiteral(resourceName: "dapple.png"))
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .background(Color(#colorLiteral(red: 0.4237234294, green: 0.3901996315, blue: 0.9996331334, alpha: 1)))
                                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                    .shadow(color: Color.black.opacity(0.17), radius: 5, x: 0, y: 5)
                                    .padding(.leading, 10)
                                TextField("your name".uppercased(), text: self.$name)
                                    
                                    .padding(.leading)
                                    .foregroundColor(Color(#colorLiteral(red: 0.607788384, green: 0.6078782678, blue: 0.6077687144, alpha: 1)))
                                    .font(.subheadline)
                                    .frame(height:44)
                                
                            }
                        }
                        
                    }.frame(height: 60)
                        .cornerRadius(20)
                        .foregroundColor(Color.offWhite)
                        .padding(.horizontal,20)
                        .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
                        
                        //                    Outer Shadow
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .padding(.horizontal,10)
                    
                    Spacer()
                    
                    Button(action: {
                        self.showContent.toggle()
                        UIApplication.shared.endEditing()
                    }) {
                        
                        VStack {
                            Text("Join WWDC20")
                                .foregroundColor(Color.offWhite)
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .frame(width: 200, height: 50)
                                .background(Color(#colorLiteral(red: 0.4237234294, green: 0.3901996315, blue: 0.9996331334, alpha: 1)))
                                .sheet(isPresented: self.$showContent) { DetailView(name: self.name) }
                                .background(
                                    ZStack {
                                        
                                        //                    Inner Shadow
                                        Color(#colorLiteral(red: 0.4235294118, green: 0.3921568627, blue: 1, alpha: 1))
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                            .foregroundColor(.offWhite)
                                            .blur(radius: 4)
                                            .offset(x: -8, y: -8)
                                        
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                            .fill(
                                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4237234294, green: 0.3901996315, blue: 0.9996331334, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                        )
                                            .padding(2)
                                            .blur(radius: 2)
                                    }
                            )
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                
                                //                    Outer Shadow
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), radius: 20, x: 20, y: 20)
                                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.7), radius: 20, x: -20, y: -20)
                        }.background(Color(#colorLiteral(red: 0.8787360191, green: 0.8779149652, blue: 0.917029798, alpha: 1)))
                            .edgesIgnoringSafeArea(.all)
                        
                    }.padding()
                }
            }.frame(width: 414, height: 800)
            
            
        }.offset(y: -self.value)
            .animation(.spring())
            .onAppear{NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { key in
                let value = key.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                self.value = value.height
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { key in
                    self.value = 0
                }}
    }
    
}

// MARK:- RoundedCorner


public struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    public var corners: UIRectCorner = .allCorners
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// MARK:- DetailView


public struct DetailView: View {
    
    let name: String
    public var body: some View {
        GeometryReader { geometry in
            VStack {
                
                HStack {
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Hello,")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                            Text("\(self.name)")
                                .font(.custom("Arial Rounded MT Bold", size: 40))
                                .fontWeight(.black)
                            
                            
                            
                        }.foregroundColor(.bluish)
                        
                    }
                    Spacer()
                }.padding()
                
                
                Image(uiImage: #imageLiteral(resourceName: "wwdc.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                ZStack {
                    Color.bluish.edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 30) {
                        Text("Thanks for joining first ever online WWDC Conference.Watch live from the Apple Center.Launching iOS 14 and A14 fatest chip ever.")
                        
                        Text("Macbook Pro With up to a 10th-generation quad-core Intel Core i7 processor, the 13-inch MacBook Pro is ready to take on even the toughest tasks. So when you’re powering through pro‑level processing jobs like compiling code, layering multiple tracks in a music composition, or encoding video, you’ll get everything done faster.The 13-inch MacBook Pro is designed to let you do everything faster and more efficiently. The new Magic Keyboard features a refined scissor mechanism with 1 mm of travel")
                    }.foregroundColor(Color.white)
                        .padding()
                    
                    
                }.cornerRadius(44, corners: [.topLeft, .topRight])
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                    .edgesIgnoringSafeArea(.bottom)
                
                
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
}

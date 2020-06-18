import PlaygroundSupport
import SwiftUI

// MARK:- LineGraphView


public struct LineGraphView: View {
    
    public init() {}
    
    @State var onSwiftUI = true
    @State var onUIKit = true

//    HardCoded SwiftUI Search Data
    
    let swiftuiTrend:[CGFloat] = [0.0,0.0,1.00,0.51,0.32,0.28,0.28,0.23,0.20,0.23,0.17,0.19,0.16,0.17,0.26,0.20,0.26,0.28,0.33,0.41,0.41,0.50,0.45,0.38,0.44,0.45,0.44,0.39,0.39,0.42,0.41,0.36,0.34,0.39,0.48,0.45,0.45,0.45,0.46,0.49,0.46,0.46,0.46,0.44,0.53,0.52,0.58,0.52,0.60,0.55,0.60]
    
    //    HardCoded UIKit Search Data
    
    let uikitTrend:[CGFloat] = [0.12,0.12,0.15,0.14,0.20,0.13,0.16,0.14,0.11,0.17,0.14,0.13,0.14,0.14,0.12,0.13,0.15,0.13,0.14,0.16,0.15,0.15,0.14,0.10,0.14,0.14,0.13,0.14,0.12,0.13,0.12,0.11,0.6,0.13,0.15,0.14,0.14,0.12,0.12,0.14,0.15,0.13,0.14,0.13,0.12,0.12,0.11,0.13,0.16,0.11,0.12]

    
    public var body: some View {
        ZStack {
             Color(#colorLiteral(red: 0.2848084332, green: 0.9237517715, blue: 0.7451558709, alpha: 1))
                           .edgesIgnoringSafeArea(.all)

            
            VStack(spacing: 40) {
         
                VStack {
                    Text(("Web Search difference between SwiftUI and UIKit in Past 12Months across the World"))
                        .bold()
                    HStack {Spacer()
                        Text("Source: trends.google.com")
                            .font(.footnote)
                            .foregroundColor(Color.black.opacity(0.5))
                        
                    }.padding(.horizontal)
                }.padding()
                
                RoundedRectangle(cornerRadius: 20)
                    .cornerRadius(10)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .frame(width: 400, height: 400, alignment: .center)
                    .shadow(color: (Color.black).opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: (Color.white).opacity(0.2), radius: 10, x: -10, y: -10)
                    
//                    Creating Line Graph
                    .overlay(LineGraph(dataPoints: swiftuiTrend)
                        .trim(to: onSwiftUI ? 1 : 0)
                        .stroke(Color.blue, lineWidth: 3)
                        .aspectRatio(16/9, contentMode: .fit)
                )
                    .overlay(LineGraph(dataPoints: uikitTrend)
                        .trim(to: onUIKit ? 1 : 0)
                        .stroke(Color.orange, lineWidth: 3)
                        .aspectRatio(16/9, contentMode: .fit)
                       )
                    .overlay(VStack{
                        Spacer()
                        HStack {
                            Text("Source: GoogleTrends")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Spacer()
                            Text("TimePeriod: Past 12Months")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }.padding()
                    })
                
                HStack(spacing: 20) {
                    
                    //                    Button 1
                    
                    Button(action: {
                        withAnimation(Animation.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 2.0)) {
                            self.onSwiftUI.toggle()
                            
                        }
                    }) {
                        HStack {
                            Circle()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(Color(#colorLiteral(red: 0.006370984018, green: 0.4774341583, blue: 0.9984987378, alpha: 1)))
                                .shadow(color: (Color.black).opacity(0.5), radius: 20, x: 10, y: 10)
                                .shadow(color: (Color.white).opacity(0.5), radius: 20, x: -10, y: -10)
                            Text("SwiftUI")
                               
                                .foregroundColor(.black)
                                .shadow(color: (Color.black).opacity(0.5), radius: 20, x: 10, y: 10)
                                .shadow(color: (Color.white).opacity(0.5), radius: 20, x: -10, y: -10)
                        }.frame(width: 100)
                    }
                    
                    //                    Button 2
                    
                    Button(action: {
                        withAnimation(Animation.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 2.0)) {
                            self.onUIKit.toggle()
                            
                        }
                    }) {
                        HStack {
                            Circle()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(Color(#colorLiteral(red: 0.9993990064, green: 0.5836774707, blue: 0, alpha: 1)))
                                .shadow(color: (Color.black).opacity(0.5), radius: 20, x: 10, y: 10)
                                .shadow(color: (Color.white).opacity(0.5), radius: 20, x: -10, y: -10)
                            Text("UIKit")
                                .foregroundColor(.black)
                                .shadow(color: (Color.black).opacity(0.5), radius: 20, x: 10, y: 10)
                                .shadow(color: (Color.white).opacity(0.5), radius: 20, x: -10, y: -10)
                        }.frame(width: 100)
                    }
                    
                    
                    //                    VStack end
                }
            }
        }
    }
}



// MARK:- LineGraph



public struct LineGraph: Shape {
    var dataPoints: [CGFloat]

    public func path(in rect: CGRect) -> Path {
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1-point) * rect.height
            return CGPoint(x: x, y: y)
        }

        return Path { p in
            guard dataPoints.count > 1 else { return }
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1-start) * rect.height))
            for idx in dataPoints.indices {
                p.addLine(to: point(at: idx))
            }
        }
    }
}


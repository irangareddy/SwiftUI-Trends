import SwiftUI
import PlaygroundSupport

// MARK:- FinalPieChartView

// Only for Pie Chart Data I imported PieChart Module Source from (https://github.com/AppPear)

public struct FinalPieChartView: View {
    public init() {}
    public var body: some View {
        
/* ## Why Use a Chart?
         
         Looking at a few points of data can be enlightening, but staring at a long list of numbers isn’t the best way to gain insight. A list of numbers doesn’t make it easier to get a sense of how warm a certain month was or determine what months are the driest.
         Most people have an easier time grasping information when it’s presented graphically. A chart can provide a graphic representation of data designed to inform the viewer.
*/
        
        ZStack{
            Color(#colorLiteral(red: 0.2848084332, green: 0.9237517715, blue: 0.7451558709, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                VStack {
                    Text(("Share of Apple devices by iOS version worldwide in 2019"))
                        .bold()
                    HStack {Spacer()
                        Text("Source: www.Statista.com")
                            .font(.footnote)
                            .foregroundColor(Color.black.opacity(0.5))
                        
                    }.padding(.horizontal)
                }.padding()
                
//                Passing Data to Pie ChartView
                
                PieChartView(data: [50,41,9], title: "iOS" )
                
                
                HStack {
                    Text("iOS13-50%")
                        
                        .foregroundColor(.black)
                        .shadow(color: (Color.black).opacity(0.5), radius: 20, x: 10, y: 10)
                        .shadow(color: (Color.white).opacity(0.5), radius: 20, x: -10, y: -10)
                        .padding()
                    Spacer()
                    Divider()
                    Text("iOS12-41%")
                        
                        .foregroundColor(.black)
                        .shadow(color: (Color.black).opacity(0.5), radius: 20, x: 10, y: 10)
                        .shadow(color: (Color.white).opacity(0.5), radius: 20, x: -10, y: -10)
                        .padding()
                    Spacer()
                    Divider()
                    Text("Old-Versions")
                        
                        .foregroundColor(.black)
                        .shadow(color: (Color.black).opacity(0.5), radius: 20, x: 10, y: 10)
                        .shadow(color: (Color.white).opacity(0.5), radius: 20, x: -10, y: -10)
                        .padding()
                }.frame(width: 400,height: 44)
                    .background(Color.white)
                    .cornerRadius(24)
                    .shadow(color: (Color.black).opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: (Color.white).opacity(0.3), radius: 10, x: -10, y: -10)
                
                
            }
        }
    }
}


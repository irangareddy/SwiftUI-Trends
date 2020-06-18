
import SwiftUI
import PlaygroundSupport


// MARK:- BarGraphView


public struct BarGraphView: View {
    
    public init() {}
//    Alter picker value for viewing in default [0...noOfValue-1]
    @State var pickerSelectedItem = 1
//    Bar graph Data
    @State var dataPoints:[[CGFloat]] = [[100,32,21,46,59,51,48,47,52,54,66,59],[53,51,50,92,46,69,100,91,44,76,93,85]]
//    Bar graph months
    @State var months: [String] = ["Jun","Jul","Aug","Sep","Oct","Nov","Dec","Jan","Feb","Mar","Apr","May"]
    
    public var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.2848084332, green: 0.9237517715, blue: 0.7451558709, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("SwiftUI Trends")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                VStack {
                    Text(("Search data in YouTube and GoogleImages for SwiftUI"))
                        .bold()
                    HStack {Spacer()
                        Text("Source: trends.google.com")
                            .font(.footnote)
                            .foregroundColor(Color.black.opacity(0.5))
                        
                    }.padding(.horizontal)
                }.padding()
                Picker(selection: $pickerSelectedItem, label: Text("")){
                    Text("Youtube Search").tag(0)
                    Text("Image Search").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal,24)
                    .frame(width: 400)
                
//                Didn't use ForEach loop Because it doesn't support animations
                HStack {
                    
                    HStack {
//                        Each Stack allows to you only 10 View so, we have 12Views total so divided 6 Views in each stack
                        BarChartView(value: dataPoints[pickerSelectedItem][0], month: months[0])
                        BarChartView(value: dataPoints[pickerSelectedItem][1], month: months[1])
                        BarChartView(value: dataPoints[pickerSelectedItem][2], month: months[2])
                        BarChartView(value: dataPoints[pickerSelectedItem][3], month: months[3])
                        BarChartView(value: dataPoints[pickerSelectedItem][4], month: months[4])
                        BarChartView(value: dataPoints[pickerSelectedItem][5], month: months[5])
                    }
                    
                    HStack {
                        BarChartView(value: dataPoints[pickerSelectedItem][6], month: months[6])
                        BarChartView(value: dataPoints[pickerSelectedItem][7], month: months[7])
                        BarChartView(value: dataPoints[pickerSelectedItem][8], month: months[8])
                        BarChartView(value: dataPoints[pickerSelectedItem][9], month: months[9])
                        BarChartView(value: dataPoints[pickerSelectedItem][10], month: months[10])
                        BarChartView(value: dataPoints[pickerSelectedItem][11], month: months[11])
                    }
                    
                    
                    
                }.padding(.top)
                    .animation(.easeInOut)
                
                
                
            }
            
            
        }
        
        
    }
}

// MARK:- BarChartView


public struct BarChartView: View {
    
    public var value: CGFloat
    public var month: String
    
    
    public var body: some View {
        
        VStack {
            
            ZStack(alignment: .bottom){
//                background Capsule
                Capsule().frame(width: 25, height: 100)
                    .foregroundColor(Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 0.5)))
//                foreground capsule
                Capsule().frame(width: 25, height: value)
                    .foregroundColor(Color.white)
                    .overlay(VStack {
//                        data representiong on top
                        Text(String(format: "%.f", value))
                            .font(.system(size: 8))
                            .padding(.top,5)
                        Spacer()
                        }
                )
                
            }
            
            Text(month)
                .font(.system(size: 10)).padding(.top,8)
        }
    }
}


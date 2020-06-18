import SwiftUI
import PlaygroundSupport

// MARK:- TabBarView


public struct TabBarView: View {
    public init() {
        
    }
    
   public var body: some View {
        VStack {
            TabView {

                BarGraphView().tabItem {
                           Image(systemName: "chart.bar.fill")
                               .font(.system(size: 25))
                           Text("Bar Graph")
                          
                       }.tag(1)
                       
                       LineGraphView().tabItem {
                            Image(systemName: "waveform.path.ecg")
                            .font(.system(size: 25))
                           Text("Line Graph")
                       }.tag(2)
                      FinalPieChartView().tabItem {
                            Image(systemName: "chart.pie.fill")
                                .font(.system(size: 25))
                           Text("Pie Chart")
                       }.tag(3)
                       
                   }.accentColor(Color(red: 0.14, green: 0.22, blue: 0.30))
                       .edgesIgnoringSafeArea(.top)
        }
    }
}




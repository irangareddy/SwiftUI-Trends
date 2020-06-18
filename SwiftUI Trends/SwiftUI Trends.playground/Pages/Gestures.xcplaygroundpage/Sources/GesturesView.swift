import PlaygroundSupport
import SwiftUI

// MARK:- GesturesView

// main gesture view

public struct GesturesView: View {
    
    
//    Changing the NavigationBarTitle on appearnce
    public init() {
        UITableView.appearance().separatorColor = .clear
      let navBarAppearance = UINavigationBar.appearance()
      navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(#colorLiteral(red: 0.07666932791, green: 0.6152535081, blue: 0.722358644, alpha: 1)) ]
      navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(#colorLiteral(red: 0.9941464067, green: 0.7100035548, blue: 0.7072272301, alpha: 1))]
    }
    
    public var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)

            VStack {
                
                VStack {
//                    Creating Navigation View
                   NavigationView {
//                    Creating List
                    List {
//                        Navigation for each one in the list to their DetailView
                        NavigationLink(destination: TapGestureView()) {
                            HStack {
                                Image(uiImage: #imageLiteral(resourceName: "tap.png"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 44, height: 44)
                                    .background(RoundedRectangle(cornerRadius: 8))
                                Text("Tap Gesture")
                            }
                        }
                        NavigationLink(destination: LongpressGestureView()) {
                            HStack {
                                Image(uiImage: #imageLiteral(resourceName: "longPress.png"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 44, height: 44)
                                .background(RoundedRectangle(cornerRadius: 8))
                                Text("Longpress Gesture")
                            }
                        }
                        NavigationLink(destination: DragGestureView()) {
                            HStack {
                                Image(uiImage: #imageLiteral(resourceName: "drag.png"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 44, height: 44)
                                .background(RoundedRectangle(cornerRadius: 8))
                                Text("Drag Gesture")
                            }
                        }
                        NavigationLink(destination: MagnificationGestureView()) {
                            HStack {
                                Image(uiImage: #imageLiteral(resourceName: "magnify.png"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 44, height: 44)
                                .background(RoundedRectangle(cornerRadius: 8))
                                Text("Magnification Gesture")
                            }
                        }
                        
                        
                        }
//                        Navigation Bar Title
                   .navigationBarTitle(Text("Gestures"))
                    }
                    }
            }.padding()
        }
         
    }
}



//: [Contents](@previous)
/*:
 - - -
 # Strokes
 
 ## Have you ever saw apple fitness rings in apple watch?
 
 If you saw those rings, yes those rings were created with "Strokes" only. In this Chapter were going to learn
 
 - How to create Strokes ?
 - How to manage light and dark modes in SwiftUI ?
 - How to create Segmented Control ?
 - What is @State and @Binding ?
 - How to diplay Image ?
 - How to use Slider ?
 
 With all these concepts we are going build a beautiful "Profile View"
 
 *  *  *  *  *
 */
/*:
  ## Profile View
 - Importing SwiftUI framework here because we are using Custom size
 - Importing  Playground support here because we are using live preview
*  *  *  *  *
*/
import SwiftUI
import PlaygroundSupport


let view = UIHostingController(rootView: StrokesView())
view.preferredContentSize = CGSize(width: 600, height: 900)

// Displaying View

PlaygroundPage.current.liveView = view

/*:
 
****
 #### Instructions
****
 - Use Slider to change stroke value.
 - Press top right to switch between light and dark modes.
 - Use Segmented Control to update the value of each stroke.
 
  For Customization View Code in Sources
 */


//: [Animations](@next)


//: [Animations](@previous)

/*:
 - Appreciation :
 Hey Congrats, on completing ![Animations chapter]() of the SwiftUI Trends Playground.
* * * * *
 # Gestures
 
 Gesture recognition is responsible for listening to a certain sequence of touch inputs and reacting accordingly. We can define actions from these interactions and even compose multiple gestures that work in sequence or simultaneously. In this chapter we will learn about the following gestures.
 
 - Tap Gesture
 - Longpress Gesture
 - Drag Gesture
 - Magnification Gesture
 - What is @GestureState ?
 - Difference between @GestureState and @State ?
 - How to create List ?
 - How to create Navigation View ?
 - How to create Navigation Link ?
 - Scale Effect ?
 - Using AVKit and playing audio ?
 - How to change Color of navigationBarTitle ?
 - How to display header in Detail GestureViews ?

*  *  *  *  *
 */

/*:
  ## Gestures View
 
 - Note:
    - If you are using system then click "option key" while viewing Magnification Gesture
    - Its like ZoomIn and ZoomOut
 
 
 
*  *  *  *  *
*/

import  PlaygroundSupport
import SwiftUI


let view = UIHostingController(rootView: GesturesView())
view.preferredContentSize = CGSize(width: 600, height: 900)


PlaygroundPage.current.liveView = view

/*:
 ****
 #### Instructions
 ****
 - Tap on each list item leads to thier respective Detail View
 - Tap Gesture : Single tap the item
 - Longpress Gesture : Longpress the item
- Drag Gesture : Drag the item
- Magnification Gesture : ZoomIn and ZoomOut (option+scroll)
 
 For Customization View Code in Sources*/
/*:
 - Important:
    ###### Recalled from previous Chapter:
     - @State and @GestureState
    - Using Animation while performing gestures
    - Using AVKit to play Audio
    - Using Image
 
 
 
*  *  *  *  *
*/



//: [Graphs](@next)

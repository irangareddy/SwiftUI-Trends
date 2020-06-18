//: [Strokes](@previous)
/*:
 - Appreciation :
 Hey Congrats, on completing ![Strokes chapter]() of the SwiftUI Trends Playground.
 * * * * *
 # Animations
 
 Animation is what you feel but in SwiftUI, we have some default animations let see those...
 
 - Default Animation
 - EaseIn
 - EaseOut
 - EaseInOut
 - Linear
 - Spring
 - Interative Spring
 - How to use Picker ?
 ---
 ##### HeadBack:
 - In the first chapter, I used strokes to animate while changing values
 ---
 
 To understand these animations we are creating a Apple Watch Breathing animation where use you can customize your animations
 
 *  *  *  *  *
 */

/*:
  ## Breathing Animation
 
 - Note:
 The animations are applicable on Breating Animation ZStatck Only, but on the CircleView's directly
 
 
 
*  *  *  *  *
*/
import SwiftUI
import PlaygroundSupport


let view = UIHostingController(rootView: AnimationView())
view.preferredContentSize = CGSize(width: 500, height: 900)


PlaygroundPage.current.liveView = view
    
    
/*:
 ****
 #### Instructions
 ****
 - Use Picker to change animation of the Breathing View.
 - For more cirlces in the BreathingView, change  "noOfCircles" value in the source code
 
 For Customization View Code in Sources*/
/*:
 - Important:
    ###### Recalled from previous Chapter:
     - @State and @Binding
    - Light and Dark Mode Usage
     - Title View
     - How read data from picker
    - How to dispaly a view
 
 
 
*  *  *  *  *
*/


//: [Gestures](@next)

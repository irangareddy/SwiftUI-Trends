//: [Graphs](@previous)
/*:
 - Appreciation :
 Hey Congrats, on completing ![Graphs and Charts chapter]()  of the SwiftUI Trends Playground.
* * * * *
 # Neumorphism
 
Neumorphism (aka neomorphism) is a relatively new design trend and a term that’s gotten a good amount of buzz lately. It’s aesthetic is marked by minimal and real-looking UI that’s sort of a new take on skeuomorphism — hence the name. It got its name in a UX Collective post from December 2019, and since then, various design and development communities have been actively discussing the trend, usually with differing opinions.
 
 With SwiftUI we can make an amazing neumorphic design...let's build 
 
 
## How to make flat design to a Neumorphic Design ?
- ![Shadows]() : Add each elements have two shadows with one light and one dark.
- ![Background Colors](): Background colors must be the same (or very similar) as the background color of the parent element.
- ![Edges]() : Rounded edges are a defining quality.
- ![Borders](): Elements can have an optional subtle border to improve contrast and make the edges a bit sharper
 
 In this chapter, we are going create ![WWDC20 Video Conference App]() with Neumorphic Design and along with this you will also learn about
 
 - Geometry Reader ?
 - How to create shadows ?
 - How to create Outer Shadows ?
 - How to create Inner Shadows ?
 - How to present view through sheet ?
 
 ---
 ##### HeadBack:
 - In all Chapters I have used shadows
 ---

  ## Join WWDC20
 
 - Note:
    - While entering your name keyboard may cause an oversize issue
    - Try to use overlay keyboard or press "Join WWDC" directly
---
*/
import  PlaygroundSupport
import SwiftUI



let view = UIHostingController(rootView:  WWDC20View())
view.preferredContentSize = CGSize(width: 414, height: 800)


PlaygroundPage.current.liveView = view


/*:
 ****
 #### Instructions
 ****
 - Shadow: Bottom of the Rounded Rectangle
 - Outer Shadow: TextField Area
 - Inner Shadow: Button
 - Sheet : NextView
 
 For Customization View Code in Sources*/
/*:
 - Important:
    ###### Recalled from previous Chapter:
    - Shadows, were there from the begining of the playground in Strokes, Gestures just go back and have a look.
    - Using Images
 
 
*  *  *  *  *
*/
//: [LetsCreateSomething](@next)

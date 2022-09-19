/*
# Homework 1
Remi Denoyer
2022-08-23
 
### Question 1:
**Hello world** for Swift, and a rich text comment.
*/

import UIKit
var str = "Hello, from Remi Denoyer"
print(str)

/*
### Question 2:
Class Rectangle in Swift, and a *rich* text comment.
Changes:
- Started at 45deg
- Rotate faster and longer
- Filling purple and rectangle is thinner
*/

import SwiftUI
import PlaygroundSupport
 
struct ExampleView: View {
    @State private var rotation: Double = 45
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.purple)
                .frame(width: 200, height: 50)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 5), value: rotation)
            
            Button(action: {
                 rotation = (rotation < 360 ? rotation + 1000 : 0)
                       }) {
                       Text("Rotate")
                   }
        }
        .padding(10)
    }
}
PlaygroundPage.current.setLiveView(ExampleView()
    .padding(100))

//
//  CircleLineView.swift
//  TaskInfoAnimationView
//
//  Created by Sumit on 02/12/24.
//

import SwiftUI

struct CircleLineView: View {
    
    @State private var isShowingCircule = true
    @State private var isAnimating = true
           var activityMessage:String
    @State private var duration = 0.8

    var body: some View {
       ZStack {
           Button {

           }
            label: {
               Text(activityMessage)
                   .frame(width: 160, height: 160)
                   .foregroundStyle(.white)
                   .font(.system(size: 30, weight: isAnimating ? .bold : .semibold, design: .default))
                   .animation(.easeInOut(duration: duration).repeatForever(autoreverses: false),
                              value: true
                   )
            }
              .padding(10)
              .overlay(
                  Circle()
                     .stroke(isShowingCircule == true ? .red : .clear,lineWidth: 3.0)
                     .shadow(color:.white, radius: 8)
                      .frame(width: 200, height: 200)
                      .phaseAnimator([false, true]) { wwdc24, chromaRotate in
                          wwdc24
                              .hueRotation(.degrees(chromaRotate ? 220 : 0))
                      } animation: { chromaRotate in
                              .easeInOut(duration: 2)
                    }
              )
              .overlay(
                  Circle()
                    .stroke(isShowingCircule == true ? .red : .clear,lineWidth: 2.4)
                     .shadow(color:.white, radius: 8)
                      .frame(width: 250, height: 250)
                      .phaseAnimator([false, true]) { wwdc24, chromaRotate in
                          wwdc24
                              .hueRotation(.degrees(chromaRotate ? 420 : 0))
                      } animation: { chromaRotate in
                              .easeInOut(duration: 2)
                      }
              )
              .overlay(
                  Circle()
                    .stroke(isShowingCircule == true ? .red : .clear,lineWidth: 1.4)
                     .shadow(color:.white, radius: 8)
                      .frame(width: 280, height: 280)
                      .phaseAnimator([false, true]) { wwdc24, chromaRotate in
                          wwdc24
                              .hueRotation(.degrees(chromaRotate ? 420 : 0))
                      } animation: { chromaRotate in
                              .easeInOut(duration: 2)
                 }
              )
              .overlay(
                  Circle()
                      .stroke(isShowingCircule == true ? .red : .clear,lineWidth: 2.0)
                      .frame(width: 350, height: 350)
                      .shadow(color:.white, radius: 8)
                      .phaseAnimator([false, true]) { wwdc24, chromaRotate in
                          wwdc24
                              .hueRotation(.degrees(chromaRotate ? 620 : 0))
                      } animation: { chromaRotate in
                              .easeInOut(duration: 2)
                  }
              )
         }
      }
  }

#Preview {
    CircleLineView(activityMessage: "")
       .preferredColorScheme(.dark)
}

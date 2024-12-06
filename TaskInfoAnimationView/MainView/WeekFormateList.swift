     //  WeekFormateList.swift
   //  TaskInfoAnimationView
 //  Created by Sumit on 03/12/24.

 import SwiftUI

 struct WeekFormateList: View {
    
     @State private var startAnimation = false
     @State private var duration = 0.8
     @State private var animationAmount = 0.8

     @ObservedObject var taskListDataModel:TaskListDataModel

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<7) { index in
                    ZStack {
                        Circle()
                            .strokeBorder(.brown, lineWidth: 4)
                            .cornerRadius(80/2)
                            .frame(width:60,height:60)
                            .shadow(color:.clear,radius: 5)
                            .tag(index)
                            .overlay(content: {
                                Text(taskListDataModel.weekDayDataSource[index])
                                    .frame(width:80,height:80)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .cornerRadius(140/2)
                                    .clipped()
                            })
                            .scaleEffect(animationAmount)
                            .onTapGesture {
                                taskListDataModel.actionToDataSoure(index: index)
                            }
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 6, height: 6, alignment: .center)
                            .cornerRadius(6/2)
                            .offset(x: -28)
                            .rotationEffect(.degrees(taskListDataModel.clickAvaliableIndex == index ? 360 : 0.0))
                            .animation(taskListDataModel.clickAvaliableIndex == index ? Animation.easeInOut(duration: duration).repeatForever(autoreverses: false) : .default,
                                       value: taskListDataModel.clickAvaliableIndex == index ? true : false
                            )
                    }
                }
            }
        }.scrollIndicators(.hidden)
        .onAppear {
              animationAmount += 0.1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                animationAmount  = 1.0
            }
        }
    }
 }

#Preview {
    WeekFormateList(taskListDataModel: TaskListDataModel())
        .preferredColorScheme(.dark)
}

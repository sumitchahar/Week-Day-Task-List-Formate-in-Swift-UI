//  ContentView.swift
//  TaskInfoAnimationView
//  Created by Sumit on 02/12/24.

import SwiftUI

struct MainViewList: View {
    
    @ObservedObject var taskListDataModel = TaskListDataModel()
    @State private var isAnimating = true
    
    var body: some View {
        ZStack {
            VStack(spacing:40) {
                HStack {
                    HeaderTextView()
                }
                HStack {
                    WeekFormateList(taskListDataModel: taskListDataModel)
                }
                .padding(.bottom,10)
                if taskListDataModel.clickAvaliableIndex != nil   {
                    HStack {
                        Text("Activity Progressing...")
                            .foregroundStyle(.white)
                            .font(.system(size: 30, weight: .bold , design: .default))
                    }
                    .padding(.bottom,110)
                    HStack {
                        CircleLineView(activityMessage: taskListDataModel.activityMessage ?? "")
                    }
                }
                Spacer()
            }.padding([.leading,.top])
        }
    }
}

#Preview {
    MainViewList()
        .preferredColorScheme(.dark)
}

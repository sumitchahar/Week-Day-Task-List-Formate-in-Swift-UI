//
//  TaskListDataModel.swift
//  TaskInfoAnimationView
//
//  Created by Sumit on 03/12/24.
//
 
import Foundation

 class TaskListDataModel:ObservableObject {
    
 
     @Published var weekDayDataSource:[String] = ["MO","TU","WE","TH","FR","SA","SU"]
     @Published var activityMessage:String?

     private var textContainer:[String] = ["File Activity","WWDC22","WWDC23","WWDC24","Tasks Activity"," No work","No work"]

     private var selectingIndex:Int = -1
     
     @Published var clickAvaliableIndex:Int?

     
     func actionToDataSoure( index:Int) {
         activityMessage = textContainer[index]
         clickAvaliableIndex = index
     }
     
     private func calculationRightIndex()-> Int {
        let finalCount = textContainer.count
           selectingIndex += 1
         if selectingIndex < finalCount {
             return selectingIndex
         } else {
             selectingIndex = -1
         }
         return 0
     }
 }

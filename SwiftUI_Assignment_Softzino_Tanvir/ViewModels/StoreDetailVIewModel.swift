//
//  StoreDetailVIewModel.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 31/8/21.
//

import Foundation

class StoreDetailVIewModel:ObservableObject{
    @Published var reviews = [
        Review(name: "Tanvir", review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ac fermentum ante. Morbi a turpis eu quam mattis condimentum. Sed dictum cursus ante, at efficitur nunc tempor et. Integer convallis sodales vestibulum. Maecenas tempor risus ut mi bibendum."),
        Review(name: "Ifa", review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ac fermentum ante. Morbi a turpis eu quam mattis condimentum. Sed dictum cursus ante")
    ]
    
    @Published var additionalOpeningHours = [AdditionalOpeningHours]()
    
    @Published var name = ""
    @Published var review = ""
    @Published var firstAppearance = true
    
    @Published var selectedDay:String = "Friday"
    @Published var startingHour = Date()
    @Published var closingHour = Date()
    
    func save(){
        reviews.append(Review(name: self.name, review: self.review))
        self.name = ""
        self.review = ""
    }
    func openingHoursSave(){
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        let shortStartingHour = self.startingHour
        let shortClosingHour = self.closingHour
        let startingHourDateString = df.string(from: shortStartingHour)
        let closingHourDateString = df.string(from: shortClosingHour)
        additionalOpeningHours.append(AdditionalOpeningHours(selectedDay: self.selectedDay, startingHour: startingHourDateString, closingHour: closingHourDateString))
        selectedDay = "Friday"
        startingHour = Date()
        closingHour = Date()
    }
}

struct AdditionalOpeningHours:Identifiable {
    var id = UUID()
    var selectedDay:String
    var startingHour:String
    var closingHour:String
}

struct Review:Identifiable{
    var id = UUID()
    var name:String
    var review:String
}

//
//  AddOpeningHourView.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 30/8/21.
//

import SwiftUI

struct AddOpeningHourView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday","Sunday"]
    @StateObject var addOpeningHourVM:StoreDetailVIewModel
    var body: some View {
        ZStack(){
            Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
            VStack{
                Form{
                    Section(){
                        Picker("Please choose a day", selection: $addOpeningHourVM.selectedDay) {
                            ForEach(days, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    
                    Section(footer:Text("Select Opening Hour")){
                        DatePicker( "", selection: $addOpeningHourVM.startingHour, displayedComponents: .hourAndMinute)
                    }
                    
                    Section(footer:Text("Select Closing Hour")){
                        DatePicker("", selection: $addOpeningHourVM.closingHour, displayedComponents: .hourAndMinute)
                    }
                    
                }
                
                Button(action: {
                    addOpeningHourVM.openingHoursSave()
                    addOpeningHourVM.firstAppearance = false
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                        Text("Save")
                            .frame(width:UIScreen.main.bounds.width - 50)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(15)
                })
                Spacer()
            }.navigationBarTitle("Add Opening Hours",displayMode: .inline)
        }
    }
}

//struct AddOpeningHourView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddOpeningHourView()
//    }
//}

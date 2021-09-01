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
            Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9813820969, alpha: 1))
            VStack{
                Form{
                    Section(){
                        Picker("Please choose a day", selection: $addOpeningHourVM.selectedDay) {
                            ForEach(days, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    Section{
                        HStack(spacing:10){
                            VStack(alignment:.leading){
                                
                                DatePicker("",selection: $addOpeningHourVM.startingHour, displayedComponents: .hourAndMinute)
                                    .offset(x: -75, y: 0)
                                
                                Text("Select Opening Hour").font(.system(size:11))
                            }
                            
                            VStack(alignment:.leading){
                                
                                DatePicker("", selection: $addOpeningHourVM.closingHour, displayedComponents: .hourAndMinute)
                                    .offset(x: -75, y: 0)
                                
                                Text("Select Closing Hour").font(.system(size:11))
                            }
                            
                        }
                    }
                    
                    
                    
                }.frame(height:190)
                
                Button(action: {
                    addOpeningHourVM.openingHoursSave()
                    addOpeningHourVM.firstAppearance = false
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                        Text("SAVE")
                            .frame(width:UIScreen.main.bounds.width - 50)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(15)
                }).padding()
                Spacer()
            }.navigationBarTitle("Add Opening Hours",displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
        }
    }
    
    var btnBack: some View {
        Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
            HStack {
                Image(systemName: "chevron.left") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    .font(.system(size: 25,weight:.bold))
            }
        }
    }
}

//struct AddOpeningHourView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddOpeningHourView()
//    }
//}

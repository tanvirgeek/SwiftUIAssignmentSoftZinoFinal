//
//  AddReviewView.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 30/8/21.
//

import SwiftUI

struct AddReviewView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var storeDetailForReviewVM:StoreDetailVIewModel
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
            VStack{
                TextField("Enter Your Name", text: $storeDetailForReviewVM.name)
                    .foregroundColor(.black)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1)
                    ).padding()
                    
                
                TextEditor(text: $storeDetailForReviewVM.review)
                    .frame(height:200)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1)
                    ).padding()
                
                
                Button(action: {
                    storeDetailForReviewVM.save()
                    storeDetailForReviewVM.firstAppearance = false
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("SAVE")
                        .frame(width:UIScreen.main.bounds.width - 50)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                })
                
                Spacer()
            }.navigationBarTitle("Add Review",displayMode: .inline)
        }
    }
}

//struct AddReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddReviewView()
//    }
//}

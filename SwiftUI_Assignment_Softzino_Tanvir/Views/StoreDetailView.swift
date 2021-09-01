//
//  StoreDetailView.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 30/8/21.
//

import SwiftUI
import Kingfisher

struct StoreDetailView: View {
    private let storeDetailVM = StoreDetailVIewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let store:StoreViewModel
    @State private var swiftUIBug = true
    
    
    var body: some View {
        ScrollView(){
            ZStack{
                Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9813820969, alpha: 1))
                VStack(alignment:.leading){
                    KFImage(URL(string: store.storeImageURL))
                        .resizable()
                        .frame(width:UIScreen.main.bounds.width-20,height: 250)
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                    
                    Text(store.storeNo + " - \(store.shoppingCenterName)")
                        .bold()
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                        .font(.system(size: 15))
                    Text(store.addressLine)
                        .bold()
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        .font(.system(size: 15))
                    
                    VStack(alignment:.leading){
                        Text("Opening Hours")
                            .font(.system(size: 15))
                            .bold()
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        VStack(alignment:.leading){
                            ForEach(0..<store.openHours.count, id: \.self){ index in
                                HStack{
                                    makeDayView(dayCount: index)
                                        .font(.system(size: 13))
                                        .padding(3)
                                    Text(" > ")
                                    Text(store.openHours[index].startingTime + "-" + store.openHours[index].closingTime)
                                        .font(.system(size: 13))
                                        .padding(3)
                                }
                            }
                        }.padding(.leading,20)
                        .padding(.trailing,20)
                        
                        //additional opening hours
                        VStack(alignment:.leading){
                            ForEach(storeDetailVM.additionalOpeningHours){ additionalOpeningHour in
                                HStack{
                                    Text(additionalOpeningHour.selectedDay)
                                        .font(.system(size: 13))
                                        .padding(3)
                                    Text(" > ")
                                    Text("\(additionalOpeningHour.startingHour)" + " - " + "\(additionalOpeningHour.closingHour)")
                                        .font(.system(size: 13))
                                        .padding(3)
                                }
                            }
                        }.padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        NavigationLink(destination: AddOpeningHourView(addOpeningHourVM: storeDetailVM), label: {
                            Text("Add More Opening Hours")
                                .font(.system(size: 13,weight:.bold))
                                .padding(10)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(20)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 25)
//                                        .stroke(Color.white, lineWidth: 2)
//                                )
                                .padding(.leading,20)
                                .shadow(color:.gray,radius: 1)
                                .padding(.top,6)
                                
                        })

                    }
                    
                    VStack(alignment:.leading){
                        Text("Reviews")
                            .font(.system(size: 15,weight:.bold))
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        ForEach(storeDetailVM.reviews){ review in
                            VStack(alignment:.leading){
                                Text(review.name)
                                    .font(.system(size: 15,weight:.bold))
                                    .padding(5)
                                
                                Text(review.review)
                                    .padding(5)
                                    .font(.system(size: 12))
                            }.padding(.leading,15)
                            .padding(.trailing,20)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color:.gray,radius: 1)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 2, trailing: 15))
                            
                        }
                        
                        NavigationLink(destination: AddReviewView(storeDetailForReviewVM: storeDetailVM), label: {
                            Text("Add Your Review")
                                .font(.system(size: 13,weight:.bold))
                                .padding(.horizontal,20)
                                .padding(.vertical,10)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(25)
                                .shadow(color:.gray,radius: 1)
                                .padding(swiftUIBug ? 15:14)
                        }).onTapGesture {
                            storeDetailVM.firstAppearance = false
                        }
                    }
                    .padding(.top, 8)
                    Spacer()
                }
            }.navigationBarTitle("\(store.storeNo) - \(store.cityName)",displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            
        }.onAppear(){
            print("First Appearance:",storeDetailVM.firstAppearance)
            if storeDetailVM.firstAppearance == false{
                print("This is not first appearance")
                swiftUIBug.toggle()
            }
            print("Detail view appeared:",storeDetailVM.reviews.count)
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
    
    func makeDayView( dayCount:Int) -> Text{
        switch dayCount {
        case 1:
            return Text("Monday")
        case 2:
            return Text("Tuesday")
        case 3:
            return Text("Wednesday")
                
        case 4:
            return Text("Thursday")
                
        case 5:
            return Text("Friday")
                
        case 6:
            return Text("Saturday")
                
        default:
            return Text("Sunday")
        }
    }
}

//struct StoreDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreDetailView()
//    }
//}

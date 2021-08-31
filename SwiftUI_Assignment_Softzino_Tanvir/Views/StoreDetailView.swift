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
    let store:StoreViewModel
    @State private var swiftUIBug = true
    
    var body: some View {
        ScrollView(){
            ZStack{
                Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
                VStack(alignment:.leading){
                    KFImage(URL(string: store.storeImageURL))
                        .resizable()
                        .frame(width:UIScreen.main.bounds.width-20,height: 250)
                        .aspectRatio(contentMode: .fit)
                    
                    Text(store.storeNo)
                        .bold()
                        .padding(7)
                    
                    Text(store.cityName)
                        .bold()
                        .padding(7)
                    
                    VStack(alignment:.leading){
                        Text("Opening Hours")
                            .bold()
                            .padding(7)
                        VStack(alignment:.leading){
                            ForEach(0..<store.openHours.count, id: \.self){ index in
                                HStack{
                                    makeDayView(dayCount: index)
                                    Text(store.openHours[index].startingTime + " > " + store.openHours[index].closingTime)
                                }
                            }
                        }.padding(.leading,20)
                        .padding(.trailing,20)
                        
                        //additional opening hours
                        VStack(alignment:.leading){
                            ForEach(storeDetailVM.additionalOpeningHours){ additionalOpeningHour in
                                HStack{
                                    Text(additionalOpeningHour.selectedDay)
                                        .bold()
                                    Text("\(additionalOpeningHour.startingHour)" + " > " + "\(additionalOpeningHour.closingHour)")
                                }
                            }
                        }.padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        NavigationLink(destination: AddOpeningHourView(addOpeningHourVM: storeDetailVM), label: {
                            Text("Add more opening hours")
                                .font(.system(size: 16,weight:.bold))
                                .padding(15)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .padding(.leading,20)
                        })

                    }
                    
                    VStack(alignment:.leading){
                        Text("Reviews")
                            .font(.system(size: 16,weight:.bold))
                            .padding()
                        ForEach(storeDetailVM.reviews){ review in
                            VStack(alignment:.leading){
                                Text(review.name)
                                    .font(.system(size: 16,weight:.bold))
                                    .padding(10)
                                
                                Text(review.review)
                                    .padding(10)
                            }.padding(.leading,50)
                            .padding(.trailing,20)
                            .background(Color.white)
                            .cornerRadius(25)
                            .padding(15)
                            
                        }
                        
                        NavigationLink(destination: AddReviewView(storeDetailForReviewVM: storeDetailVM), label: {
                            Text("Add Your Review")
                                .font(.system(size: 16,weight:.bold))
                                .padding()
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .padding(swiftUIBug ? 15:14)
                        }).onTapGesture {
                            storeDetailVM.firstAppearance = false
                        }
                    }
                    .padding(.top, 15)
                    Spacer()
                }
            }.navigationBarTitle("\(store.storeNo) - \(store.cityName)",displayMode: .inline)
            
        }.onAppear(){
            print("First Appearance:",storeDetailVM.firstAppearance)
            if storeDetailVM.firstAppearance == false{
                print("This is not first appearance")
                swiftUIBug.toggle()
            }
            print("Detail view appeared:",storeDetailVM.reviews.count)
        }
        
    }
    
    func makeDayView( dayCount:Int) -> Text{
        switch dayCount {
        case 1:
            return Text("Monday")
                .bold()
        case 2:
            return Text("Tuesday")
                .bold()
        case 3:
            return Text("Wednesday")
                .bold()
        case 4:
            return Text("Thursday")
                .bold()
        case 5:
            return Text("Friday")
                .bold()
        case 6:
            return Text("Saturday")
                .bold()
        default:
            return Text("Sunday")
                .bold()
        }
    }
}

//struct StoreDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreDetailView()
//    }
//}

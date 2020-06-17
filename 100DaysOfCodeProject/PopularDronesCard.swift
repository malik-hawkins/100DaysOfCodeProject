//
//  PopularDronesCard.swift
//  100DaysOfCodeProject
//
//  Created by Malik Hawkins on 6/15/20.
//  Copyright © 2020 Malik Hawkins. All rights reserved.
//

import SwiftUI

struct PopularDronesCard: View {
    var body: some View {
        
        VStack(){
            HStack(){
                Image("dronePic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                VStack(alignment: .leading, spacing: 5){
                    
                    // These values will later be replaced with real data
                    
                    Text("DJI").font(.system(size: 15, weight:.bold)) // Or maybe image of brand logo ???
                    Text("Mavic Pro").font(.system(size: 15, weight:.bold))
                    Text("2020 Edition").font(.system(size: 15, weight:.bold)).foregroundColor(Color.gray)
                    Text("$125 / week").font(.system(size: 15, weight:.bold)).foregroundColor(Color.gray)
                }.padding()
            }
            Button(action: {
                print("Implement book bow")
            }) {
                Text("Book Now")
                    .font(.system(size: 15, weight:.bold))
                    .frame(minWidth: 0, maxWidth: .greatestFiniteMagnitude, minHeight: 50)
                    .background(Color.init(white: 0.95))
                    .foregroundColor(Color.init(red: 14/255, green: 219/255, blue: 139/255))
                    .cornerRadius(6)
            }.padding(.horizontal)
        }.padding().background(Color.white).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
            .padding(.horizontal)
        
    } // Ending body
}

struct PopularDronesCard_Previews: PreviewProvider {
    static var previews: some View {
        PopularDronesCard()
    }
}

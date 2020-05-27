//
//  Welcome.swift
//  100DaysOfCodeProject
//
//  Created by Malik Hawkins on 5/27/20.
//  Copyright © 2020 Malik Hawkins. All rights reserved.
//

import SwiftUI

struct Welcome: View {
   
         @State private var username: String = ""
           @State private var password: String = ""
           
           var body: some View {
               GeometryReader{ geo in
                   VStack(alignment: .leading, spacing:50){
                       VStack(alignment:.leading){
                           Text("Welcome,")
                               .font(.largeTitle)
                               .fontWeight(.bold)
                           Text("sign in to continue!")
                               .font(.title)
                               .foregroundColor(Color.gray)
                               .fontWeight(.semibold)
                       }.padding(.top,100).padding(.leading,40)
                       VStack(alignment: .trailing){
                           TextField("Enter Username", text: self.$username)
                               .padding(.all)
                               .frame(height:50)
                               .background(Color.init(white: 0.95))
                               .cornerRadius(6)
                               .font(.system(size: 13, weight:.bold))
                           SecureField("Enter Password", text: self.$password)                  .padding(.all)
                               .frame(height:50)
                               .background(Color.init(white: 0.95))
                               .cornerRadius(6)
                               .font(.system(size: 13, weight:.bold)).foregroundColor(Color.primary)
                           Button(action: {
                               print("Implement Forgot Password!")
                           }) {
                               Text("Forgot Password?").font(.system(size: 14)).fontWeight(.semibold)
                           }
                           Spacer()
                                
                               HStack(alignment: .center) {
                                   Button(action: {
                                       print("Implement login!")
                                   }) {
                                       Text("Sign Up")
                                   }
                                   
                                   Spacer()
                                   Button(action: {
                                       print("Implement next button")
                                   }) {
                                       Text("Next")
                                           .font(.system(size: 15, weight:.bold))
                                           .frame(minWidth: 0, maxWidth: 100, minHeight: 45)
                                           .background(Color.init(red: 14/255, green: 219/255, blue: 139/255))
                                           .foregroundColor(Color.white)
                                           .cornerRadius(6)
                                   }
                               }
                       }.padding(.leading,40).padding(.trailing,40)
                   }
               }
               
           } //Ending body
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}

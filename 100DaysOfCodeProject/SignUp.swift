//
//  SignUp.swift
//  100DaysOfCodeProject
//
//  Created by Malik Hawkins on 5/27/20.
//  Copyright © 2020 Malik Hawkins. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .leading, spacing:50){
                VStack(alignment:.leading){
                    Text("Hello!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
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
                    SecureField("Re-Enter Password", text: self.$password)                  .padding(.all)
                        .frame(height:50)
                        .background(Color.init(white: 0.95))
                        .cornerRadius(6)
                        .font(.system(size: 13, weight:.bold)).foregroundColor(Color.primary)
                    Spacer()
                    Spacer()
         
                }.padding(.leading,40).padding(.trailing,40)
                Button(action: {
                    print("Implement next button")
                }) {
                    Text("Next")
                        .font(.system(size: 15, weight:.bold))
                        .frame(minWidth: 0, maxWidth: .greatestFiniteMagnitude, minHeight: 50)
                        .background(Color.init(red: 14/255, green: 219/255, blue: 139/255))
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                }.padding(.horizontal)
            }
        }
        
    }   //Ending body
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

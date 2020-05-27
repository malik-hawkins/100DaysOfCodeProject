//
//  ForgotPassword.swift
//  100DaysOfCodeProject
//
//  Created by Malik Hawkins on 5/27/20.
//  Copyright © 2020 Malik Hawkins. All rights reserved.
//

import SwiftUI

struct ForgotPassword: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .center, spacing: 20){
                VStack(alignment: .center){
                    Text("Forgot Password ?")
                        .font(.title)
                        .fontWeight(.bold)
                }.padding(.top,100).padding(.bottom, 20)
                Text("Please enter the email address \nassociated with your account!")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                VStack(alignment: .trailing){
                    TextField("Enter Email Address", text: self.$email)
                        .padding(.all)
                        .frame(height:50)
                        .background(Color.init(white: 0.95))
                        .cornerRadius(6)
                        .font(.system(size: 13, weight:.bold))
                    
                    Spacer()
                    Spacer()
 
                }.padding(.leading,40).padding(.trailing,40)
                
                Button(action: {
                    print("Implement next button")
                }) {
                    Text("Next")
                        .font(.system(size: 15, weight:.bold))
                        .frame(minWidth: 0, maxWidth: .greatestFiniteMagnitude, minHeight: 45)
                        .background(Color.init(red: 14/255, green: 219/255, blue: 139/255))
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                }.padding(.horizontal)
                
            }
        }
    }
    
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}

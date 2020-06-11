//
//  ForgotPassword.swift
//  100DaysOfCodeProject
//
//  Created by Malik Hawkins on 5/27/20.
//  Copyright © 2020 Malik Hawkins. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ForgotPassword: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var alertMessage = "Something went wrong"
    @State private var showAlert = false
    
    var alert: Alert {
        Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("Dismiss")))
    }
    
    
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
                    
                    self.sendResetPassword()
                    
                }) {
                    Text("Next")
                        .font(.system(size: 15, weight:.bold))
                        .frame(minWidth: 0, maxWidth: .greatestFiniteMagnitude, minHeight: 45)
                        .background(Color.init(red: 14/255, green: 219/255, blue: 139/255))
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                }.padding(.horizontal).alert(isPresented: self.$showAlert, content: {self.alert})
                
            }
        }
    } // Ending body
    
    func sendResetPassword(){
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil{
                self.alertMessage = error?.localizedDescription ?? ""
                self.showAlert = true
                print(error?.localizedDescription ?? "")
            } else {
                self.showAlert = true
                self.alertMessage = "Reset password email sent. Go back to the welcome page to sign in."
                print("Reset password sent to \(self.email)")
            }
        }
        
    }
    
} // Ending view


struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}

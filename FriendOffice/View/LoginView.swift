//
//  LoginView.swift
//  FriendOffice
//
//  Created by Netaxis on 06/08/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var variables : Variables
   @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [Color("background"),Color( "background1")], startPoint: .top, endPoint: .bottomLeading).ignoresSafeArea()
                
                VStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: 220, height: 200).foregroundColor(Color("background1"))
                        VStack{
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 120, height:120)
                                .foregroundStyle(Color.purple)
                        }
                    }.padding(.top, 40)
                    Spacer()
                    VStack{
                        TextField("email", text: $variables.email)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .frame(width: 290, height: 40)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        SecureField("password", text: $variables.password)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                            .frame(width: 290, height: 40)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        if !variables.email.isEmpty && !variables.password.isEmpty {
                            Button {
                                if let user = users.first(where: { $0.email == variables.email && $0.password == variables.password }) {
                                    variables.name = user.name ?? ""
                                    
                                    variables.isLoggedIn = true
                                }
                            }label: {
                                Text("Log IN")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 40)
                                    .background(Color("background"))
                                    .cornerRadius(20)
                            }
                        } else {
                            Button {
                                variables.alertMessage = "Please fill all the fields"
                                    variables.showAlert = true
                            } label: {
                                Text("Log IN")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 40)
                                    .background(Color("background"))
                                    .cornerRadius(20)
                            }
                        }
                        
                        HStack{
                            Text("Don't have Account ?")
                            NavigationLink(destination: RegisterView(variables: Variables())){
                                Text("Sign UP")
                            }
                            
                        }
                    }.padding(.bottom, 160)
                    Spacer()
                    
                    
                } .alert(isPresented: $variables.showAlert) {
                    Alert(title: Text("Error"), message: Text(variables.alertMessage), dismissButton: .default(Text("OK")))
                }
               
                
            }.navigationBarBackButtonHidden()
           
        }
    }
}

#Preview {
    LoginView(variables: Variables())
}


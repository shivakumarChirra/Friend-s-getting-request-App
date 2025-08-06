//
//  RegisterView.swift
//  FriendOffice
//
//  Created by Netaxis on 06/08/25.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var  users: [UserModel] = []
    @ObservedObject var variables : Variables
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [Color("background"),Color( "background1")], startPoint: .top, endPoint: .bottomLeading).ignoresSafeArea()
                
                VStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: 220, height: 200).foregroundColor(Color("background1"))
                        VStack{
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 120, height:120)
                                .foregroundStyle(Color.purple)
                        }
                    }
                    Spacer()
                    VStack{
                        TextField("Name", text: $variables.name)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .frame(width: 290, height: 40)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("email", text: $variables.email)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .frame(width: 290, height: 40)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        SecureField("password", text: $variables.password)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .frame(width: 290, height: 40)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        if !variables.name.isEmpty && !variables.email.isEmpty && !variables.password.isEmpty {
                            Button {
                                let newUser = User(context: viewContext)
                                newUser.name = variables.name
                                newUser.email = variables.email
                                newUser.password = variables.password
                                newUser.notificationMessage = ""

                                do {
                                    try viewContext.save()
                                    variables.isLoggedIn = true // tell MainView
                                    variables.Navigate = false // (not needed if using MainView switch)
                                }  catch {
                                    variables.alertMessage = "Failed to save user"
                                        variables.showAlert = true
                                }
                                } label: {
                                Text("Sign UP")
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
                                Text("Sign IN")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 40)
                                    .background(Color("background"))
                                    .cornerRadius(20)
                            }
                        }
                        HStack{
                            Text("Already have Account ?")
                            NavigationLink(destination: LoginView(variables: variables)){
                                Text("Log IN")
                            }
                        }
                    }.padding(.bottom, 160)
                    Spacer()
                    
                    
                }.alert(isPresented: $variables.showAlert) {
                    Alert(title: Text("Alert"), message: Text(variables.alertMessage), dismissButton: .default(Text("OK")))
                }
                .navigationDestination(isPresented: $variables.Navigate, destination: {
                    FriendMainView(variables: variables)
                })
                .padding(.top, 40)
            }.navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    RegisterView(variables: Variables())
}

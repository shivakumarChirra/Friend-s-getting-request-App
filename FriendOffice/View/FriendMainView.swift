//
//  ContentView.swift
//  FriendOffice
//
//  Created by Netaxis on 06/08/25.
//

import SwiftUI

struct FriendMainView: View {
    @ObservedObject var variables: Variables
    @State var  users: [User] = []
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationStack {
        ZStack{
            LinearGradient(colors: [Color("background"),Color( "background1")], startPoint: .top, endPoint: .bottomLeading).ignoresSafeArea()
           
                VStack{
                    
                    HeaderView(variables: variables)
                    UserCardView(variables: variables)
                    
                    
                    Spacer()
                    
                    LogOutView(variables: variables)
                        .padding()
                        .background(Color("card"), in: RoundedRectangle(cornerRadius: 7 ))
                    
                }
            }
            
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    FriendMainView(variables: Variables())
}

struct HeaderView: View {
    @ObservedObject var variables : Variables
    var body: some View {
        HStack{
            Text("Friend's App")
                .foregroundStyle(Color.purple)
            
                .font(.system(size: 30, weight: .bold, design: .default))
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .frame(width: 180, height: 120).foregroundColor(Color("card"))
                VStack{
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 50, height:50)
                        .foregroundStyle(Color.white)
                    Text(variables.name)
                        .foregroundStyle(Color.white)
                    Text(variables.email)
                        .foregroundStyle(Color.white)
                }
            }
            
        }
    }
}


struct LogOutView: View {
    @ObservedObject var variables: Variables

    var body: some View {
        Button(action: {
            //Properly log out
            variables.name = ""
            variables.email = ""
            variables.password = ""
            variables.isLoggedIn = false
        }) {
            Text("Log Out")
                .foregroundColor(.red)
                .bold()
        }
    }
}


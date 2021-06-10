//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserManger
    @StateObject private var timer = TimeCounter()
    @AppStorage("username") var username = ""

    var body: some View {
        VStack {
            Text("Hi, \(username)!")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            ButtonView(timer: timer)
                .offset(x: 0, y: 40)
            Spacer()
            ButtonLogoutView()
                .offset(x: 0, y: 140)
            Spacer()
        }
        .onAppear(perform: {
            if !user.name.isEmpty{
                username = user.name
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManger())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ButtonLogoutView: View {
    @EnvironmentObject var user: UserManger
    var body: some View {
        Button(action:changeView) {
            Text("Log out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
    private func changeView() {
        !user.isRegister
            ? user.firstTransition = true
            : user.isRegister.toggle()
    }
}

//
//  ContentView.swift
//  tp Morpion
//
//  Created by goldorak on 13/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     
        VStack {
            Image("logo morpion")
                .resizable()
                .padding()
                .frame(width: 250.0, height: 150.0)
                
            NavigationView(){
                NavigationLink(destination: JeuView()) {
                    Text("Jouer")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                
            }
        }
        .padding()
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

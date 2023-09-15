//
//  jeuVue.swift
//  tp Morpion
//
//  Created by goldorak on 13/09/2023.
//

import SwiftUI

struct JeuView: View {
    @State private var grille = Array(repeating: "", count: 9) // variable grille
    @State private var joueur = "X" // variable joueur
    @State private var gameOver = false // Varible
   
    var body: some View {
        VStack {
            Text("Tour du joueur : \(joueur)")
                .font(.headline)
                .padding(.bottom, 20)
            
            
            
            
            
            //Utilisez un tableau d’instances GridItem pour configurer la disposition des éléments dans une grille .
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(0..<9) { index in // 9 cases
                    Button(action: {
                        if grille[index] == "" && !gameOver
                        { // l'index sert a pointer les une case
                            grille[index] = joueur
                            checkVictoire()
                            joueur = (joueur == "X") ? "O" : "X"
                            
                        }
                    }) {
                        
                        if (grille[index] == "X"){ // le joueur X joue
                            Image("croix 1")  // L'image de la croix sera sélectionnés
                                .resizable()
                                .padding()
                                .frame(width: 80.0, height: 80.0)
                            
                            
                        }
                        
                        else if (grille[index] == "O") {
                            Image("rond")
                                .resizable()
                                .padding()
                                .frame(width: 80.0, height: 80.0)
                        }
                        
                        else {
                            Text(grille[index]) // les config des case de a gille
                                .font(.system(size: 60))
                                .frame(width: 80, height: 80)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                    }
                }
            }
            .disabled(gameOver)
            
            
            
            Button("Recommencer"){ // permet de recommencer
                for i in 0 ... 8 {
                    grille[i] = "";
                }
                gameOver = false
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            if gameOver { //affichage quand une game est terminé (Regler la condition de victoire)
                
                /*if (joueur == "X" && gameOver){
                    Text("Le gagnant est le joueur O")
                        .font(.title)
                        .foregroundColor(.red)
                }
                
                else if (joueur == "O" &&  gameOver){
                    Text("Le gagnant est le joueur X")
                        .font(.title)
                        .foregroundColor(.red)
                }
                
                else {
                    Text("Egalité")
                        .font(.title)
                        .foregroundColor(.red)
                }*/
                Text("Partie terminée!")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
    }
    
    
   
    private func checkVictoire()  {  // la fonction qui verifie si une des conditions de fin de jeu est remplis
        let victoire: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
       
        for pattern in victoire {
            if grille[pattern[0]] == joueur && grille[pattern[1]] == joueur && grille[pattern[2]] == joueur { //paterne de victoir
                gameOver = true
                return
            }
        
            
        }
       
        if !grille.contains("") {
            gameOver = true
        }
    }
}


struct JeuView_Previews: PreviewProvider {
    static var previews: some View {
        JeuView()
    }
}

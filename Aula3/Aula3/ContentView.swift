//
//  ContentView.swift
//  Aula3
//
//  Created by Turma02-24 on 23/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var peso: Double = 1
    @State var altura: Double = 1
    @State var imc: Double = 0
    @State var tipo = "tipo"
    
    func calculaimc(){
        if altura > 0 {
            imc = peso / (altura * altura)
        }else{
                imc = 0
            }
        }
    
    
    func cor() -> Color {
        if imc == 0 {
             return Color.blue
        } else if imc < 18.5 {
           return Color.baixopeso
            
        }else if imc > 18.5 && imc < 24.9 {
           return  Color.normal
            
        } else if imc > 25 && imc < 29.99 {
            return Color.sobrepeso
            
        } else if imc > 30 {
            return Color.obeso
           
        }
        return Color.blue
        
    }
    
    var body: some View {
        ZStack{
            cor()
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            
            VStack{
                Text("Calculadora de IMC")
                    .font(.system(size: 30))
                    .bold()
                
                TextField( "digite", value:$peso,formatter: NumberFormatter())
                    .frame(width: 330)
                    .multilineTextAlignment(.center)
                    .padding(4)
                    .background()
                    .cornerRadius(4)
                    .padding()
                
                TextField( "digite",value:$altura,formatter: NumberFormatter())
                    .frame(width: 330)
                    .multilineTextAlignment(.center)
                    
                    .padding(4)
                    .background()
                    .cornerRadius(4)
                    .padding()
                
                Button(action: calculaimc){
                    Text("Calcular")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
                        
                }
                
                Spacer()
                if imc == 0 {
                    Text("IMC")
                        .font(.system(size:45))
                        .foregroundStyle(.white)
                        .bold()
                } else if imc < 18.5 {
                    Text("Baixo peso")
                        .font(.system(size:45))
                        .foregroundStyle(.white)
                        .bold()
                }else if imc > 18.5 && imc < 24.9 {
                    Text("Normal")
                        .font(.system(size:45))
                        .foregroundStyle(.white)
                        .bold()
                } else if imc > 25 && imc < 29.99 {
                    Text("Sobrepeso")
                        .font(.system(size:45))
                        .foregroundStyle(.white)
                        .bold()
                } else if imc > 30 {
                    Text("Obesidade")
                        .font(.system(size:45))
                        .foregroundStyle(.white)
                        .bold()
                }
                
                Spacer()
                
                Image(.tabela)
                .resizable()
                .scaledToFit()
                .frame(width:500)
    
    
                
            }}
        
       
    }
}

#Preview {
    ContentView()
}

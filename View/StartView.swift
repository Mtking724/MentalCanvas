//
//  StartView.swift
//  MentalCanvas
//
//  Created by Motoki Okayasu on 2023/11/26.
//

import SwiftUI

struct StartView: View {
    
  
    var body: some View {
        ZStack{
            Color.mint
                .ignoresSafeArea()

            VStack{
                Image("artMan")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200 )
                Text("MentalCanvasへようこそ。")
                    .fontWeight(.medium)
                    .padding(.top)
                    .offset(y: 30)
                    .foregroundColor(.white)
                    .font(.title2)
                
            
                      }
                }
                
            }
        }
    
#Preview {
    StartView()
}

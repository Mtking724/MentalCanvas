//
//  SecondExplainView.swift
//  MentalCanvas
//
//  Created by Motoki Okayasu on 2023/11/26.
//

import SwiftUI

struct SecondExplainView: View {
    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            VStack {
                Image("makingArtWomen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Text("MentalCamvasでは,")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .font(.title3)
                Text("自由なアートを通して")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .font(.title3)
                Text("あなたのメンタル状況をAIが推測します。")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .font(.title3)
                     
            }
        }
    }
}

#Preview {
    SecondExplainView()
}

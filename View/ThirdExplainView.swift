//
//  ThirdExplainView.swift
//  MentalCanvas
//
//  Created by Motoki Okayasu on 2023/11/26.
//

import SwiftUI

struct ThirdExplainView: View {
    var body: some View {
        ZStack{
            Color.mint
                .ignoresSafeArea()
            VStack{
                Image("drawMonster")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Text("さっそく自由に今の気持ちに合う")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .font(.title3)
                Text("イラストを描いてみましょう。")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .font(.title3)
            }
        }
    }
}

#Preview {
    ThirdExplainView()
}

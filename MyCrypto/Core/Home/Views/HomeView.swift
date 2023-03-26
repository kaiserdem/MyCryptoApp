//
//  HomeView.swift
//  MyCrypto
//
//  Created by kaiserdem  on 26.03.2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var shadowPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content leyer
            VStack {
                homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: shadowPortfolio ? "plus" : "info")
                .animation(.none)
                .background(
                    CircleButtonAnimationView(animate: $shadowPortfolio)
                )
            Spacer()
            Text(shadowPortfolio ? "Prices" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: shadowPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        shadowPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
}

//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Akshit Saxena on 1/22/25.
//

import SwiftUI

struct FrameworkGridView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())] // number of vertical columns = 2
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns) {
                    // ForEcah will use framework id to iterate over
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                    }
                    
                    
                }
            }
            .navigationTitle("Apple Frameworks")
        }
        .preferredColorScheme(.dark)
        
        
      
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}

struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90) // adjust this to number of columns
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6) // min.shrink value
        }
        .padding()
    }
}

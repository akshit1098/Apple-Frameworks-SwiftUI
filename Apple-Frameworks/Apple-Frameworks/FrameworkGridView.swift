//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Akshit Saxena on 1/22/25.
//

import SwiftUI

struct FrameworkGridView: View {
    
    // State object will stay and persist and maintain it's state even when everytime the struct is destroyed and re-render
    @StateObject var viewModel = FrameworkGridVewModel()
    
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
                            .onTapGesture {
                                // we are assigning the slectedFramework to the framework
                                viewModel.selectedFramework = framework
                            }
                    }
                    
                    
                }
            }
            .navigationTitle("Apple Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework!, isShowDetailView: $viewModel.isShowingDetailView)
            }
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

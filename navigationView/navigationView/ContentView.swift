//
//  ContentView.swift
//  navigationView
//
//  Created by Nishanth on 29/07/24.
//

import SwiftUI

class CustomNavigationPath: ObservableObject{
    @Published var navigatioPaths:[ScreenItem] = []
    
    enum screenNames: Hashable{
        case firstscreen
        case secondscreen
        case thirdscreen
        case fourthscreen
    }
    func addView(view: ScreenItem) {
        self.navigatioPaths.append(view)
    }
    
    func backView(){
        self.navigatioPaths.removeLast()
    }
    struct ScreenItem: Hashable {
           var screen: screenNames?
           var value: String?
       }
    
    func backtoSpecificView(string: screenNames){
        if let index = navigatioPaths.firstIndex(where: { $0.screen == string }) {
                    self.navigatioPaths.removeLast(navigatioPaths.count - index - 1)
                }
        
        
    }
    
    func removeAllScreen(){
        self.navigatioPaths.removeAll()
    }
    
}

struct ContentView: View {
    
    @EnvironmentObject private var navigationPath :CustomNavigationPath
    
    var body: some View {
        
        NavigationStack(path: $navigationPath.navigatioPaths) {
            
            VStack {
                Button {
                    self.navigationPath.addView(view: CustomNavigationPath.ScreenItem(screen: .firstscreen, value: "First screen"))
                } label: {
                    Text("Move to next screen")
                }
            }
            .navigationDestination(for: CustomNavigationPath.ScreenItem.self) { screens in
                switch screens.screen{
                case .firstscreen :
                    if let values = screens.value{
                        FirstScreen(screename: .constant(values))

                    }
                case .secondscreen:
                    if let values = screens.value{
                        SecondScreen(screename: .constant(values))

                    }
                case .thirdscreen:
                    if let values = screens.value{
                        ThirdScreen(screename: .constant(values))
                    }
                case .fourthscreen:
                    if let values = screens.value{
                        FourthScreen(screename: .constant(values))
                    }
                case .none:
                    EmptyView()
                }
            }
            
            
            
        }
        
        
    }
}

#Preview {
    ContentView()
}

//
//  FirstScreen.swift
//  navigationView
//
//  Created by Nishanth on 29/07/24.
//

import SwiftUI

struct FirstScreen: View {
    @EnvironmentObject private var navigationPath :CustomNavigationPath
    @Binding var screename: String

    var body: some View {
        VStack{
            Text(screename)

            Button {
                navigationPath.addView(view: CustomNavigationPath.ScreenItem(screen: .secondscreen, value: "Second screen"))

            } label: {
                Text("Next")
            }
        }
    }
}

#Preview {
    FirstScreen(screename: .constant(""))
}



struct SecondScreen: View {
    @EnvironmentObject private var navigationPath :CustomNavigationPath
    @Binding var screename: String

    var body: some View {
        
        VStack {
            Text(screename)

            Button {
                navigationPath.addView(view: CustomNavigationPath.ScreenItem(screen: .thirdscreen, value: "Third screen"))

            } label: {
                Text("Next")
            }
        }
    }
}



struct ThirdScreen: View {
    @EnvironmentObject private var navigationPath :CustomNavigationPath
    @Binding var screename: String

    var body: some View {
        VStack{
            Text(screename)
            
            
            Button {
                navigationPath.addView(view: CustomNavigationPath.ScreenItem(screen: .fourthscreen, value: "Fourth screen"))
            } label: {
                Text("Next")
            }

        }
    }
}


struct FourthScreen: View {
    @EnvironmentObject private var navigationPath :CustomNavigationPath

    @Binding var screename: String
    var body: some View {
        VStack(spacing: 25) {
            Text(screename)
            
            Button {
                navigationPath.backView()
            } label: {
                Text("back to screen")
            }
            
            
            Button {
                navigationPath.removeAllScreen()
            } label: {
                Text("Move to Home screen")
            }
            
            
            Button {

                navigationPath.backtoSpecificView(string: .secondscreen)
            } label: {
                Text("Back to Second screen")
            }

        }
       
    }
}

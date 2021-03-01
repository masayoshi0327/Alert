//
//  ContentView.swift
//  Alert
//
//  Created by 澤崎正佳 on 2021/03/01.
//

import SwiftUI

struct ContentView: View {
    @State var goodAlert = false //いいね！ボタンの方のアラートを出すためのブール値
    @State var isGood = false //サムズアップに色をつけるかどうかのブール値
    @State var noGoodAlert = false //よくないね！ボタンの方のアラートを出すためのブール値
    
    var body: some View {
        VStack{
            // サムズアップのマーク。isGoodがtrueになると色がつく。
            Image(systemName: isGood ? "hand.thumbsup.fill":"hand.thumbsup")
                .font(.title)
                .foregroundColor(isGood ? .pink:.none)
                .padding()
            // いいね！ボタン
            Button(action: {
                goodAlert = true // このアクションでアラートを呼び出す
            }, label: {
                buttonLabel(text: "いいね！", fieldColor: Color.pink)
            })
                .padding()
                // goodAlertがtrueになると呼び出されるアラート
                .alert(isPresented: $goodAlert, content: {
                    Alert(
                        title: Text("いいね！しますか？"),
                        message: Text("いいね！すると色がつきます。"),
                        primaryButton: .default(Text("はい"),
                                                action: {isGood = true}),
                        secondaryButton: .destructive(Text("いいえ"),
                                                      action: {isGood = false})
                    )
                })
            // よくないね！ボタン
            Button(action: {
                noGoodAlert = true // このアクションでアラートを呼び出す
            }, label: {
                buttonLabel(text: "よくないね！", fieldColor: Color.blue)
            })
                .padding()
                // noGoodAlertがtrueになると呼び出されるアラート
                .alert(isPresented: $noGoodAlert, content: {
                    Alert(title: Text("そんなこと言わないで"),
                          dismissButton: .default(Text("了解です")))
                })
        }
    }
}

struct buttonLabel: View {
    let text: String
    let fieldColor: Color
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(.white)
            .frame(width: 250, height: 100)
            .background(fieldColor)
            .cornerRadius(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

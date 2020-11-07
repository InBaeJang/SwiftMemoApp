//
//  ContentView.swift
//  SwiftUIMemo
//
//  Created by 장인배 on 2020/11/07.
//

import SwiftUI

struct MemoListScene: View {
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter
    
    var body: some View {
        NavigationView {
            List(store.list){ memo in
                VStack(alignment:.leading) { // 아래에 추가되는 내용들이 vertical하게 추가됨
                    Text(memo.content)
                        .font(.body)
                        .lineLimit(1)
                    
                    Text("\(memo.insertDate, formatter: self.formatter)")
                        .font(.caption)
                        //이렇게 뒤에 붙은 걸 identifier라 한다.
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
            }
            .navigationBarTitle("내 메모")
        }//List에 키를 두고 cmd+shift+a 키
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
            
    }
}

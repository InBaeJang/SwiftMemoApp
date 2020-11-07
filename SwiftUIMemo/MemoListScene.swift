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
                MemoCell(memo:memo) // 뷰를 만들어주는 생성자로 리팩토링
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

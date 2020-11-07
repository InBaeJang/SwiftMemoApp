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
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list){ memo in
                MemoCell(memo:memo) // 뷰를 만들어주는 생성자로 리팩토링
            }
            .navigationBarTitle("내 메모")
            .navigationBarItems(trailing: ModalButton(show: $showComposer))
            .sheet(isPresented: $showComposer, content: { ComposeScene(showComposer: self.$showComposer)
                .environmentObject(self.store)
            })
        }//List에 키를 두고 cmd+shift+a 키
    }
}

fileprivate struct ModalButton: View {
    @Binding var show: Bool // 파라미터 바인딩 설정. 값이 복사되지 않고 바인딩되어 저장된다.
    
    var body: some View {
        Button(action: {
            self.show = true
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MemoListScene()
                .environmentObject(MemoStore())
                .environmentObject(DateFormatter.memoDateFormatter)
            MemoListScene()
                .environmentObject(MemoStore())
                .environmentObject(DateFormatter.memoDateFormatter)
        }
    }
}

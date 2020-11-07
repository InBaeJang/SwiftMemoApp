//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by 장인배 on 2020/11/07.
//

import SwiftUI

struct MemoCell: View {
    //생성자로 전달받은 Memo를 저장할 것임
    //@ObservedObject: 메모객체가 새롭게 그려질 때마다 뷰가 새로 그려짐
    @ObservedObject var memo:Memo
    @EnvironmentObject var formatter: DateFormatter
    
    
    var body: some View {
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
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}

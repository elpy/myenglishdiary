//
//  NotePlacementSelection.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 25.01.2021.
//

import SwiftUI

enum NotePlacement {
    case plain
    case inGroup(group: DiaryRecordsGroup)
    case inNewGroup
}

extension View {
    func notePlacementSelectionSheet(
        groups: [DiaryRecordsGroup],
        isPresented: Binding<Bool>,
        _ pressHandler: @escaping (_ placement: NotePlacement) -> Void
    ) -> some View {
        return self.actionSheet(isPresented: isPresented) { () -> ActionSheet in
            var buttons: [ActionSheet.Button] = [
                .default(Text("Добавить"), action: { pressHandler(.plain) })
            ]

            buttons.append(contentsOf: groups.compactMap { group -> ActionSheet.Button in
                .default(Text("Добавить в «\(group.name)»"), action: { pressHandler(.inGroup(group: group)) })
            })

            buttons.append(.default(Text("Добавить в новую группу"), action: {
                pressHandler(.inNewGroup)
            }))

            buttons.append(.cancel(Text("Отмена"), action: { }))

            return ActionSheet(
                title: Text("Новая запись в дневнике"),
                message: Text("Заметки можно добавлять в группы или сразу в дневник"),
                buttons: buttons
            )
        }
    }
}

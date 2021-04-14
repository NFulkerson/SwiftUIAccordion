//
//  Accordion.swift
//  SwiftUIAccordion
//
//  Created by Nathan on 4/14/21.
//

import SwiftUI

public struct Accordion: View {
  @ObservedObject public var viewModel = AccordionDataModel()

  public var body: some View {
    ScrollView(.vertical, showsIndicators: true) {
      VStack(spacing: 0) {
        ForEach(viewModel.content, id: \.title) { item in
          AccordionContainer(content: item)
        }

      }.padding()
    }
    .animation(.easeIn)
  }

  public init() {
    viewModel.update(data: AccordionDataModel.mockData())
  }

}

struct Accordion_Previews: PreviewProvider {
  static var previews: some View {
    Accordion().environmentObject(makeDataModel())
  }

  static func makeDataModel() -> AccordionDataModel {
    let model = AccordionDataModel()
    model.update(
      data: [
        AccordionContent(
          title: "Hello",
          icon: Image(systemName: "star"),
          items: [],
          expanded: false
        )
      ]
    )
    return model
  }
}

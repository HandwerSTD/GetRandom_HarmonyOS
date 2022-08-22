import myInput from "../common/myinput"
import myListItemBtn from "../common/mylistitem"
import ArrayList from "@ohos.util.ArrayList"
import myItem from "../common/myitem"


@Entry
@Component

struct Index {
  @State iName: string = ""
  @State iWeight: string = ""
  @State list: Array<myItem> = []
  private btnList: ArrayList<myItem> = new ArrayList()

  private addItem() {
//    AlertDialog.show({title: this.iName, message: this.iWeight.toString()})
    this.btnList.add(new myItem(this.iName, parseInt(this.iWeight)))
    this.list = this.btnList.convertToArray()
//    AlertDialog.show(({title: this.list.length.toString(), message: this.btnList.length.toString()}))
  }
  private getRandom() {
    var total = 0
    for (var i = 0; i < this.list.length; ++i) {
      total += this.list[i].itemWeight

    }
//    AlertDialog.show({title: 'debug', message: total.toString()})

    var gen = Math.random() * (total)
//    AlertDialog.show({title: 'debug', message: gen.toString()})

    total = 0
    for (var i = 0; i < this.list.length; ++i) {
      total += this.list[i].itemWeight
      if (total >= gen) {
        AlertDialog.show({title: "结果", message: this.list[i].itemName})
        break
      }
    }
  }
  private clearAll() {
    this.list = []
    this.btnList.clear()
  }

  build() {
    Flex({direction:FlexDirection.Column, justifyContent:FlexAlign.Center, alignItems:ItemAlign.Center}) {
      Text("列表抽签")
        .fontSize(40)

      List({space: 5}){
        ForEach(this.list, (item) => {
          ListItem() {
            myListItemBtn({itemName: item.itemName, itemWeight: item.itemWeight})
          }
        })
      } .width("90%")
        .height("50%")
        .scrollBar(BarState.Auto)
        .margin({top: "5%"})

      myInput({placeholder: "名称", inputValue: $iName})
      myInput({placeholder: "加权", inputValue: $iWeight})
      Button("添加")
        .margin({top: "10"})
      .onClick(() => {
        this.addItem()
      })
      Button("生成")
        .margin({top: "10"})
      .onClick(() => {
//        AlertDialog.show({title: "qaq", message: 'qwq'})
        this.getRandom()

      })
      Button("删除")
      .margin({top: 10})
      .onClick(() => {
        this.clearAll()
      })
    }
    .width("100%")
    .height("100%")

  }
}
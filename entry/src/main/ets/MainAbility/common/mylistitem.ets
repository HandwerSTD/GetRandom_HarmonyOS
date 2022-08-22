@Component

struct myListItemBtn {
  itemName: string
  itemWeight: number
  build() {
    Button(this.itemName + " " + this.itemWeight)
      .fontColor("#000")
    .backgroundColor("#fff")
    .border({width: 2, radius: 2, color: "#66CCFF"})
    .width("100%")
  }
}

export default myListItemBtn
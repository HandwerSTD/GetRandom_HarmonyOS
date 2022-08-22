@Component

struct myInput {
  @Prop placeholder: string
  @Link inputValue: string

  build() {
    TextInput({placeholder: this.placeholder, text: this.inputValue})
      .onChange((value: string) => {
        this.inputValue = value
      })
      .width("80%")
      .height(40)
      .margin({top: "10"})
  }
}

export default myInput

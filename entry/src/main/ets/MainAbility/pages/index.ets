import { CircularImage } from '@ohos/libcircularimage'
import prompt from '@system.prompt';

@Entry
@Component
struct Index {
  @State imageWidth: number = 175
  @State imageHeight: number = 175
  @State imageWidth1: number = 130
  @State imageHeight1: number = 140
  @State imageSource: string = '/common/images/test.jpg'
  @State imageSource2: string = '/common/images/test2.jpg'

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start }) {
        Text('CircleImageViewSample')
          .fontSize(20)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(5)
          .width('100%')
          .backgroundColor(Color.Black)
          .fontColor(Color.White)
        CircularImage({
          imageRadius: 50,
          needBorder: true,
          borderWidth: 5,
          borderColor: '#0000FF',
          imageWidth: $imageWidth,
          imageHeight: $imageHeight,
          imageSource: $imageSource,
          onClick: () => {
            prompt.showToast({
              message: 'Circular Image is clicked'
            })
          }
        })
        CircularImage({
          imageRadius: 80,
          needBorder: true,
          borderWidth: 5,
          borderColor: '#0000FF',
          imageWidth: $imageWidth,
          imageHeight: $imageHeight,
          imageSource: $imageSource,
          onClick: () => {
            prompt.showToast({
              message: 'Circular Image is clicked'
            })
          }
        })
        CircularImage({
          imageRadius: 60,
          needBorder: true,
          borderWidth: 8,
          borderColor: '#000000',
          imageWidth: $imageWidth1,
          imageHeight: $imageHeight1,
          imageSource: $imageSource2,
          onClick: () => {
            prompt.showToast({
              message: 'Circular Image is clicked'
            })
          }
        })
        CircularImage({
          imageRadius: 60,
          needBorder: true,
          borderWidth: 8,
          borderColor: '#000000',
          imageWidth: $imageWidth1,
          imageHeight: $imageHeight1,
          imageSource: $imageSource2,
          marginTop: 10,
          marginBottom: 10,
          marginLeft: 10,
          marginRight: 10,
          onClick: () => {
            prompt.showToast({
              message: 'Circular Image is clicked'
            })
          }
        })
        CircularImage({
          imageRadius: 60,
          needBorder: true,
          borderWidth: 8,
          borderColor: '#AD8AFE',
          imageWidth: $imageWidth1,
          imageHeight: $imageHeight1,
          imageSource: $imageSource2,
          paddingTop: 0,
          paddingBottom: 10,
          paddingLeft: 0,
          paddingRight: 0,
          onClick: () => {
            prompt.showToast({
              message: 'Circular Image is clicked'
            })
          }
        })
      }
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
  }
}
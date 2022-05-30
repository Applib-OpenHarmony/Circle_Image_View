/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { CircularImage, CircleImageModel, ClickListener } from '@ohos/libcircularimage'
import prompt from '@system.prompt';

@Entry
@Component
struct Index {
  model: CircleImageModel.Model = new CircleImageModel.Model();
  model_second: CircleImageModel.Model = new CircleImageModel.Model();
  model_third: CircleImageModel.Model = new CircleImageModel.Model();
  model_fourth: CircleImageModel.Model = new CircleImageModel.Model();
  model_fifth: CircleImageModel.Model = new CircleImageModel.Model();
  model_sixth: CircleImageModel.Model = new CircleImageModel.Model();
  @State imageWidth: number = 175
  @State imageHeight: number = 175
  @State imageWidth1: number = 130
  @State imageHeight1: number = 140
  @State imageWidth2: number = 110
  @State imageHeight2: number = 120
  @State imageSource: string = '/common/images/test.jpg'
  @State imageSource2: string = '/common/images/test2.jpg'

  public aboutToAppear(): void {
    this.updateModelForFirst()
    this.updateModelForSecond()
    this.updateModelForThird()
    this.updateModelForFourth()
    this.updateModelForFifth()
    this.updateModelForSixth()
  }

  updateModelForFirst() {
    this.model.reset()
    this.model.setSrcPath(this.imageSource)
    this.model.setImageWidth(this.imageWidth)
    this.model.setImageHeight(this.imageHeight)
    this.model.setImageRadius(50)
    this.model.setNeedBorder(true)
    this.model.setBorderWidth(5)
    this.model.setBorderColor('#0000FF')
    this.model.setClickListener({
      onClick() {
        console.info('onClick event reached app')
        prompt.showToast({
          message: 'Circle Image is clicked'
        })
      }
    })
  }

  updateModelForSecond() {
    this.model_second.reset()
    this.model_second.setSrcPath(this.imageSource)
    this.model_second.setImageWidth(this.imageWidth)
    this.model_second.setImageHeight(this.imageHeight)
    this.model_second.setImageRadius(80)
    this.model_second.setNeedBorder(true)
    this.model_second.setBorderWidth(5)
    this.model_second.setBorderColor('#0000FF')
  }

  updateModelForThird() {
    this.model_third.reset()
    this.model_third.setSrcPath(this.imageSource2)
    this.model_third.setImageWidth(this.imageWidth1)
    this.model_third.setImageHeight(this.imageHeight1)
    this.model_third.setImageRadius(60)
    this.model_third.setNeedBorder(true)
    this.model_third.setBorderWidth(8)
    this.model_third.setBorderColor('#000000')
  }

  updateModelForFourth() {
    this.model_fourth.reset()
    this.model_fourth.setSrcPath(this.imageSource2)
    this.model_fourth.setImageWidth(this.imageWidth1)
    this.model_fourth.setImageHeight(this.imageHeight1)
    this.model_fourth.setImageRadius(60)
    this.model_fourth.setNeedBorder(true)
    this.model_fourth.setBorderWidth(8)
    this.model_fourth.setBorderColor('#000000')
    this.model_fourth.setMarginTop(10)
    this.model_fourth.setMarginBottom(10)
    this.model_fourth.setMarginLeft(10)
    this.model_fourth.setMarginRight(10)
  }

  updateModelForFifth() {
    this.model_fifth.reset()
    this.model_fifth.setSrcPath(this.imageSource2)
    this.model_fifth.setImageWidth(this.imageWidth2)
    this.model_fifth.setImageHeight(this.imageHeight2)
    this.model_fifth.setImageRadius(50)
    this.model_fifth.setNeedBorder(true)
    this.model_fifth.setBorderWidth(8)
    this.model_fifth.setBorderColor('#AD8AFE')
    this.model_fifth.setPaddingBottom(5)
    this.model_fifth.setClickListener({
      onClick() {
        console.info('onClick event reached app')
        prompt.showToast({
          message: 'Circle Image is clicked'
        })
      }
    })
  }

  updateModelForSixth() {
    this.model_sixth.reset()
    this.model_sixth.setSrcPath(this.imageSource2)
    this.model_sixth.setImageWidth(this.imageWidth2)
    this.model_sixth.setImageHeight(this.imageHeight2)
    this.model_sixth.setImageRadius(50)
    this.model_sixth.setPaddingTop(5)
  }

  build() {
    Column() {
      Scroll() {
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start }) {
          Text('CircleImageViewSample')
            .fontSize(20)
            .lineHeight(25)
            .border({ width: 1 })
            .padding(5)
            .width('100%')
            .backgroundColor(Color.Black)
            .fontColor(Color.Pink)

          CircularImage({
            model: this.model
          })
          CircularImage({
            model: this.model_second,
            onClick: () => {
              prompt.showToast({
                message: 'Circular Image is clicked'
              })
            }
          })
          CircularImage({
            model: this.model_third,
            onClick: () => {
              prompt.showToast({
                message: 'Circular Image is clicked'
              })
            }
          })
          CircularImage({
            model: this.model_fourth,
            onClick: () => {
              prompt.showToast({
                message: 'Circular Image is clicked'
              })
            }
          })
          CircularImage({
            model: this.model_fifth
          })
          CircularImage({
            model: this.model_sixth,
            onClick: () => {
              prompt.showToast({
                message: 'Circular Image is clicked'
              })
            }
          })
        }
      }
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
  }
}

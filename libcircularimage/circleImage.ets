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

import image from '@ohos.multimedia.image';
import CircleImageModel from "./CircleImageModel"

@Component
export struct CircularImage {
  @State model: CircleImageModel.Model = new CircleImageModel.Model();
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private img: ImageBitmap
  private onClick: (() => void)

  build() {
    Canvas(this.context)
      .width(this.model.imageWidth)
      .height(this.model.imageHeight)
      .onReady(() => {
        if (this.model.srcPath !== undefined) {
          this.img = new ImageBitmap(this.model.srcPath)

          var imageSourceApi = image.createImageSource(this.model.srcPath);

          imageSourceApi.getImageInfo().then(info => {
            var imgWidth = info.size.width;
            var imgHeight = info.size.height;
            console.info("Succeeded in obtaining the image info: " + imgWidth + " " + imgHeight);

            console.info('Image details: ' + imgWidth + " " + imgHeight);
            var imageAspectRatio = imgWidth / imgHeight;
            var canvasAspectRatio = this.model.imageWidth / this.model.imageHeight;
            var renderableHeight, renderableWidth, xStart, yStart;
            console.info('aspect ratio: ' + imageAspectRatio + " " + canvasAspectRatio);

            // If image's aspect ratio is less than canvas's we fit on height
            // and place the image centrally along width
            if (imageAspectRatio < canvasAspectRatio) {
              console.info("High canvasAspectRatio ");
              renderableHeight = this.model.imageHeight;
              renderableWidth = imgWidth * (renderableHeight / imgHeight);
              xStart = (this.model.imageWidth - renderableWidth) / 2;
              yStart = 0;
            }

            // If image's aspect ratio is greater than canvas's we fit on width
            // and place the image centrally along height
            else if (imageAspectRatio > canvasAspectRatio) {
              console.info("High imageAspectRatio ");
              renderableWidth = this.model.imageWidth
              renderableHeight = imgHeight * (renderableWidth / imgWidth);
              xStart = 0;
              yStart = (this.model.imageHeight - renderableHeight) / 2;
            }

            // Keep aspect ratio
            else {
              console.info("keep aspect ratio ");
              renderableHeight = this.model.imageHeight;
              renderableWidth = this.model.imageWidth;
              xStart = 0;
              yStart = 0;
            }
            console.info("Values " + xStart + " " + yStart + " " + renderableWidth + " " + renderableHeight);

            this.context.imageSmoothingEnabled = false
            // var r = { x: 0, y: 0, w: this.model.imageWidth, h: this.model.imageHeight, r: 0.4 * size };
            var r = {
              x: xStart,
              y: yStart,
              w: renderableWidth,
              h: renderableHeight,
              r: 0
            };
            const size = Math.min(r.w, r.h)
            if (this.model.imageRadius != -1) {
              r.r = this.model.imageRadius;
            } else {
              r.r = 0.4 * size
            }
            this.context.save();
            this.context.beginPath();
            this.context.arc(size / 2, size / 2, r.r, 0, 2 * Math.PI);
            if (this.model.needBorder) {
              this.context.lineWidth = this.model.borderWidth;
              this.context.strokeStyle = this.model.borderColor;
              this.context.stroke();
            }

            this.context.closePath();
            this.context.clip();
            this.context.drawImage(this.img, r.x, r.y, r.w, r.h);
            this.context.restore();
          }).catch(e => {
            console.info("Error in obtaining the image info: " + e);
          })
        }
      })
      .onClick(() => this.onClick())
      .margin({
        top: this.model.marginTop,
        bottom: this.model.marginBottom,
        left: this.model.marginLeft,
        right: this.model.marginRight
      })
      .padding({
        top: this.model.paddingTop,
        bottom: this.model.paddingBottom,
        left: this.model.paddingLeft,
        right: this.model.paddingRight
      })
  }
}

export { CircleImageModel } from "./CircleImageModel";

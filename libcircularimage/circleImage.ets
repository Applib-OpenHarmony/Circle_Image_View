import prompt from '@system.prompt';
import image from '@ohos.multimedia.image';

@Component
export struct CircularImage {
  @Link imageWidth: number
  @Link imageHeight: number
  @State imageRadius: number = -1
  @Prop needBorder: boolean
  @State borderWidth: number = 5
  @State borderColor: string = '#FF00FF'
  @Link imageSource: string
  @State marginLeft: number = 0
  @State marginRight: number = 0
  @State marginTop: number = 0
  @State marginBottom: number = 0
  @State paddingTop: number = 0
  @State paddingBottom: number = 0
  @State paddingLeft: number = 0
  @State paddingRight: number = 0
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private img: ImageBitmap
  private onClick: (() => void)

  build() {
    Canvas(this.context)
      .width(this.imageWidth)
      .height(this.imageHeight)
      .onReady(() => {
        this.img = new ImageBitmap(this.imageSource)

        var imageSourceApi = image.createImageSource(this.imageSource);

        imageSourceApi.getImageInfo().then(info => {
          var imgWidth = info.size.width;
          var imgHeight = info.size.height;
          console.info("Succeeded in obtaining the image info: " + imgWidth + " " + imgHeight);

          console.info('Image details: ' + imgWidth + " " + imgHeight);
          var imageAspectRatio = imgWidth / imgHeight;
          var canvasAspectRatio = this.imageWidth / this.imageHeight;
          var renderableHeight, renderableWidth, xStart, yStart;
          console.info('aspect radio: ' + imageAspectRatio + " " + canvasAspectRatio);

          // If image's aspect ratio is less than canvas's we fit on height
          // and place the image centrally along width
          if (imageAspectRatio < canvasAspectRatio) {
            console.info("High canvasAspectRatio ");
            renderableHeight = this.imageHeight;
            renderableWidth = imgWidth * (renderableHeight / imgHeight);
            xStart = (this.imageWidth - renderableWidth) / 2;
            yStart = 0;
          }

          // If image's aspect ratio is greater than canvas's we fit on width
          // and place the image centrally along height
          else if (imageAspectRatio > canvasAspectRatio) {
            console.info("High imageAspectRatio ");
            renderableWidth = this.imageWidth
            renderableHeight = imgHeight * (renderableWidth / imgWidth);
            xStart = 0;
            yStart = (this.imageHeight - renderableHeight) / 2;
          }

          // Keep aspect ratio
          else {
            console.info("keep aspect ratio ");
            renderableHeight = this.imageHeight;
            renderableWidth = this.imageWidth;
            xStart = 0;
            yStart = 0;
          }
          console.info("Values " + xStart + " " + yStart + " " + renderableWidth + " " + renderableHeight);

          this.context.imageSmoothingEnabled = false
          // var r = { x: 0, y: 0, w: this.imageWidth, h: this.imageHeight, r: 0.4 * size };
          var r = {
            x: xStart,
            y: yStart,
            w: renderableWidth,
            h: renderableHeight,
            r: 0
          };
          const size = Math.min(r.w, r.h)
          if (this.imageRadius != -1) {
            r.r = this.imageRadius;
          } else {
            r.r = 0.4 * size
          }
          this.context.save();
          this.context.beginPath();
          this.context.arc(size / 2, size / 2, r.r, 0, 2 * Math.PI);
          if (this.needBorder) {
            this.context.lineWidth = this.borderWidth;
            this.context.strokeStyle = this.borderColor;
            this.context.stroke();
          }

          this.context.closePath();
          this.context.clip();
          this.context.drawImage(this.img, r.x, r.y, r.w, r.h);
          this.context.restore();
        }).catch(e => {
          console.info("Error in obtaining the image info: " + e);
        })
      })
      .onClick(() => this.onClick())
      .margin({ top: this.marginTop, bottom: this.marginBottom, left: this.marginLeft, right: this.marginRight })
      .padding({ top: this.paddingTop, bottom: this.paddingBottom, left: this.paddingLeft, right: this.paddingRight })
  }
}
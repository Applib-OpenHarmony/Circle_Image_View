## Circle Image:

This library is developed to provide circle image implemented using extended typescript.

<hr/>

**Download and Install:**

`npm install @ohos/libcircularimage --save`

Details about OpenHarmony NPM environment configuration, click [here](https://gitee.com/openharmony-tpc/docs/blob/master/OpenHarmony_npm_usage.md).

<hr/>

**Instructions for Use:**

*1. Import files and code dependencies*

`import {CircularImage, CircleImageModel, ClickListener} from '@ohos/libcirclularimage'`

*2. Initialize Model Data*

`model: CircleImageModel.Model = new CircleImageModel.Model();`

*3. Initialize the Circular Image*

```
CircularImage({
    model: this.model,
    onClick: () => {
         prompt.showToast({
              message: 'Circular Image is clicked'
         })
    }
})
```

*4. Call the corresponding function of Model and display the target image*

```
updateModelForFirst() {
    this.model.reset()
    this.model.setSrcPath(this.imageSource)
    this.model.setImageWidth(this.imageWidth)
    this.model.setImageHeight(this.imageHeight)
    this.model.setImageRadius(50)
    this.model.setNeedBorder(true)
    this.model.setBorderWidth(5)
    this.model.setBorderColor('#0000FF')
}
```

*5. Interface Description*

```
model: CircleImageModel.Model = new CircleImageModel.Model();

Reset: model.reset()
```

Set Image source path:  `model.setSrcPath()`

Set Image width: `model.setImageWidth()`

Set Image height: `model.setImageHeight()`

Set Image radius: `model.setImageRadius()`

Whether a border is required: `model.setNeedBorder()`

Set border width: `model.setBorderWidth()`

Set border color: `model.setBorderColor()`

Set the click event: `model.setClickListener()`

<hr/>

**Directory Structure:**

```
|---- ImageCircle
      |---- libcircularimage  #circle image library
            |---- src
                  |---- clickListener.ets
                  |---- CircleImageModel.ets
                  |---- circleImage.ets
      |---- entry  #Sample Code Folder
            |---- src
                  |---- main
                        |---- MainAbility
                              |---- pages 
                                    |---- index.ets  
```
<hr/>

**Compatibility:**

Supports OpenHarmony API version 8 and above.

<hr/>

**Code Contribution:**

If you find any problems during usage, you can submit an [Issue](https://github.com/Applib-OpenHarmony/CircleImage/issues) to us. Of course, we also welcome you to send us [PR](https://github.com/Applib-OpenHarmony/CircleImage/pulls). Please enjoy and participate in open source freely.

<hr/>

**Open Source Protocol:**

This project is based on Apache License 2.0 , please enjoy and participate in open source freely.

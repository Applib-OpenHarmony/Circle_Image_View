Circle Image

This library is developed to provide circle image implemented using extended typescript.

Download and Install

npm install @ohos/libcircularimage --save

For more information on OpenHarmony npm environment configuration, please refer to How to install OpenHarmony npm package .

Instructions for Use:

1. Import files and code dependencies

import {CircularImage} from '@ohos/libcirclularimage'

2. Initialize Model Data

model: CircleImageModel.Model = new CircleImageModel.Model();

3. Initialize the Circular Image

CircularImage({
    model: this.model,
    onClick: () => {
         prompt.showToast({
              message: 'Circular Image is clicked'
         })
    }
})

4. Call the corresponding function of Model and display the target image

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

Compatibility

Supports OpenHarmony API version 8 and above.

Code Contribution

If you find any problems during usage, you can submit an Issue to us. Of course, we also welcome you to send us PR. Please enjoy and participate in open source freely.

Open Source Protocol

This project is based on Apache License 2.0 , please enjoy and participate in open source freely.

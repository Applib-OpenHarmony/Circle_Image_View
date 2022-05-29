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

import { ClickListener } from './ClickListener'

export namespace CircleImageModel {
  export class Model {
    srcPath: string
    imageWidth: number = 0
    imageHeight: number = 0
    imageRadius: number = -1
    needBorder: boolean = false
    borderWidth: number = 5
    borderColor: string = '#FF00FF'
    marginLeft: number = 0
    marginRight: number = 0
    marginTop: number = 0
    marginBottom: number = 0
    paddingTop: number = 0
    paddingBottom: number = 0
    paddingLeft: number = 0
    paddingRight: number = 0
    clickListener: ClickListener = null

    setSrcPath(srcPathParam: string): Model {
      this.srcPath = srcPathParam
      return this
    }

    setImageWidth(imageWidth: number): Model {
      this.imageWidth = imageWidth
      return this
    }

    setImageHeight(imageHeight: number): Model {
      this.imageHeight = imageHeight
      return this
    }

    setImageRadius(imageRadius: number): Model {
      this.imageRadius = imageRadius
      return this
    }

    setNeedBorder(needBorder: boolean): Model {
      this.needBorder = needBorder
      return this
    }

    setBorderWidth(borderWidth: number): Model {
      this.borderWidth = borderWidth
      return this
    }

    setBorderColor(borderColor: string): Model {
      this.borderColor = borderColor
      return this
    }

    setMarginLeft(marginLeftParam: number): Model {
      this.marginLeft = marginLeftParam
      return this
    }

    setMarginRight(marginRightParam: number): Model {
      this.marginRight = marginRightParam
      return this
    }

    setMarginTop(marginTopParam: number): Model {
      this.marginTop = marginTopParam
      return this
    }

    setMarginBottom(marginBottomParam: number): Model {
      this.marginBottom = marginBottomParam
      return this
    }

    setPaddingTop(paddingTopParam: number): Model {
      this.paddingTop = paddingTopParam
      return this
    }

    setPaddingBottom(paddingBottomParam: number): Model {
      this.paddingBottom = paddingBottomParam
      return this
    }

    setPaddingLeft(paddingLeftParam: number): Model {
      this.paddingLeft = paddingLeftParam
      return this
    }

    setPaddingRight(paddingRightParam: number): Model {
      this.paddingRight = paddingRightParam
      return this
    }

    setClickListener(clickListener: ClickListener = null): Model {
      this.clickListener = clickListener
      return this
    }

    reset(): Model {
      this.srcPath = undefined
      this.imageWidth = 0
      this.imageHeight = 0
      this.imageRadius = -1
      this.needBorder = false
      this.borderWidth = 0
      this.borderColor = '#FF00FF'
      this.marginLeft = 0
      this.marginRight = 0
      this.marginTop = 0
      this.marginBottom = 0
      this.paddingTop = 0
      this.paddingBottom = 0
      this.paddingLeft = 0
      this.paddingRight = 0
      this.clickListener = null
      return this
    }
  }
}

export default CircleImageModel

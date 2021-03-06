/*
 Copyright 2017-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MDCTextInputControllerFloatingPlaceholder.h"

extern const CGFloat MDCTextInputDefaultBorderRadius;
extern const CGFloat MDCTextInputDefaultUnderlineActiveHeight;

/**
 Material Design compliant text field from 2017. The logic for 'automagic' error states changes:
 underline color, underline text color.
 https://www.google.com/design/spec/components/text-fields.html#text-fields-single-line-text-field

 The placeholder text is laid out inline. If floating is enabled, it will float above the field when
 there is content or the field is being edited. The character count is below text. The Material
 Design guidelines call this 'Floating inline labels.'
 https://material.io/guidelines/components/text-fields.html#text-fields-labels
*/
@interface MDCTextInputControllerDefault : NSObject <MDCTextInputControllerFloatingPlaceholder>

/**
 The color behind the input and label that defines the preferred tap zone.

 Default is borderFillColorDefault.
 */
@property(nonatomic, nullable, strong) UIColor *borderFillColor;

/**
 Default value for borderFillColor.

 Default is clear.
 */
@property(class, nonatomic, null_resettable, strong) UIColor *borderFillColorDefault;

/**
 Should the controller's .textInput grow vertically as new lines are added.

 If the text input does not conform to MDCMultilineTextInput, this parameter has no effect.

 Default is YES.
 */
@property(nonatomic, assign) BOOL expandsOnOverflow;

/**
 The minimum number of lines the controller's .textInput should use for rendering text.

 The height of an empty text field is measured in potential lines. If the value were 3, the height
 of would never be shorter than 3 times the line height of the input font (plus clearance for
 auxillary views like the underline and the underline labels.)

 The smallest number of lines allowed is 1. A value of 0 has no effect.

 If the text input does not conform to MDCMultilineTextInput, this parameter has no effect.

 Default is 1.
 */
@property(nonatomic, assign) NSUInteger minimumLines;

@end

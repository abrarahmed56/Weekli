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

#import "MaterialThemes.h"
#import "MaterialActivityIndicator.h"

/**
 Used to apply a color scheme to theme MDCActivityIndicator.
 */
@interface MDCActivityIndicatorColorThemer : NSObject

/**
 Applies a color scheme to theme a MDCActivityIndicator. Use a UIAppearance proxy to apply a color
 scheme to all instances of MDCActivityIndicator.

 @param colorScheme The color scheme to apply to MDCActivityIndicator.
 @param activityIndicator A MDCActivityIndicator instance to apply a color scheme.
 */
+ (void)applyColorScheme:(id<MDCColorScheme>)colorScheme
     toActivityIndicator:(MDCActivityIndicator *)activityIndicator;

@end

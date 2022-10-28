//
//  AwesomeLibraryViewManager.m
//  AwesomeLibrary
//
//  Created by Gustavo Harff on 28/10/22.
//  Copyright © 2022 Facebook. All rights reserved.
//

#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(AwesomeLibraryViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(color, NSString)
RCT_EXPORT_VIEW_PROPERTY(items, NSArray)
RCT_EXPORT_VIEW_PROPERTY(onPress, RCTBubblingEventBlock)
@end


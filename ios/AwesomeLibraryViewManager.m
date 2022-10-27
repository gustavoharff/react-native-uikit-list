#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(AwesomeLibraryViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(color, NSString)
RCT_EXPORT_VIEW_PROPERTY(items, NSArray)
RCT_EXPORT_VIEW_PROPERTY(onPress, RCTBubblingEventBlock)
@end

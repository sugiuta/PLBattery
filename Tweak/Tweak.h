#import <UIKit/UIKit.h>

@interface _UIBatteryView : UIView
- (void)setBodyColorAlpha:(CGFloat)arg1;
- (void)setPinColorAlpha:(CGFloat)arg1;
- (void)setBodyColor:(UIColor *)arg1;
- (void)setPinColor:(UIColor *)arg1;
@end

@interface _UIStatusBarIdentifier : NSObject
@property (nonatomic, copy) NSString *string;
@end

@interface _UIStatusBarDisplayItem : NSObject
@property (nonatomic, weak, readonly) id item;
@property (nonatomic, copy, readonly) id identifier;
@end


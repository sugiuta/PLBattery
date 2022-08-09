#import "Tweak.h"

%hook _UIBatteryView
- (id)initWithFrame:(CGRect)frame {
    id orig = %orig;
    [self setBodyColorAlpha:1.0];
    [self setPinColorAlpha:1.0];
    return orig;
}

- (void)setChargingState:(NSInteger)arg1 {
    if (arg1 == 1) {
        [self setBodyColor:[UIColor greenColor]];
        [self setPinColor:[UIColor greenColor]];
    } else {
        [self setBodyColor:[UIColor labelColor]];
        [self setPinColor:[UIColor labelColor]];
    }
    return %orig;
}

- (void)setShowsPercentage:(BOOL)arg1 { //　Display percentage label on battery icon
    return %orig(YES);
}

- (void)setShowsInlineChargingIndicator:(BOOL)arg1 { // Remove charging icon
    return %orig(NO);
}
%end

%hook _UIStatusBarDisplayItem
- (void)setEnabled:(BOOL)arg1 { // Remove the percentage label in control center
    NSString *identifier = [(_UIStatusBarIdentifier *)[self identifier] string];
    if ([[self item] isKindOfClass:objc_getClass("_UIStatusBarBatteryItem")] && [identifier isEqualToString:@"percentDisplayIdentifier"]) return %orig(NO);
	else return %orig;
}
%end

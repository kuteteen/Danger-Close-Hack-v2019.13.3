//
//  Tweak.xm
//
//
//  Created by @Y_Dagriri on 7/8/19.
//  Copyright © 2019 @Y_Dagriri. All rights reserved.
//

#import <substrate.h>
#import <mach-o/dyld.h>
#import <UIKit/UIKit.h>
#import <SCLAlertView/SCLAlertView.h>



uint64_t getRealOffset(uint64_t offset){
return _dyld_get_image_vmaddr_slide(0)+offset;
}


void (* PlayerMovement_Update)(void *PlayerMovement);
void _PlayerMovement_Update(void *PlayerMovement) {
*(float *)((uint64_t)PlayerMovement + 0x74) = 100.0f;
PlayerMovement_Update(PlayerMovement);

}



%ctor {
MSHookFunction((void *)getRealOffset(0x1011D3888), (void *)_PlayerMovement_Update, (void **)&PlayerMovement_Update);
}




%hook UnityAppController
- (void)applicationDidBecomeActive:(id)application {
SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
[alert addTimerToButtonIndex:0 reverse:YES];
alert.customViewColor = [UIColor purpleColor];
alert.iconTintColor = [UIColor greenColor];
alert.backgroundType = SCLAlertViewBackgroundBlur;
alert.hideAnimationType = SCLAlertViewHideAnimationSlideOutToTop;
alert.showAnimationType =  SCLAlertViewShowAnimationSlideInFromTop;
[alert addButton: @"@Y_Dagriri" actionBlock: ^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/Y_Dagriri"]];
}];
[alert addButton: @"♠Donate to me♠" actionBlock: ^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.me/klashksa1"]];
}];
[alert addButton: @"iOSMods.com" actionBlock: ^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.iosmods.com/"]];
}];
[alert showSuccess: @"Danger Close v2019.13.3"
subTitle: @"High Jump hack is automatically active\nHacked by @Y_Dagriri\nVisit us for more hacks."
closeButtonTitle: @"Enjoy!"
duration: 30.0f];
return %orig;
}
%end

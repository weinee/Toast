//
//  WNHttpProcessHUD.m
//  Toast
//
//  Created by weineeL on 16/9/26.
//
//

#import "WNHttpProcessHUD.h"
#import "UIView+Toast.h"

#define DURATION 1
#define keyWindow [[UIApplication sharedApplication] keyWindow]

@implementation WNHttpProcessHUD

+ (void)fadeOutFinishHUDInView:(UIView *)view withMessage:(NSString *)text compalete:(void(^)(void)) messageComplete{
	[view makeToast:text
		   duration:DURATION
		   position:CSToastPositionBottom
			  title:nil
			  image:nil
			  style:nil
		 completion:^void(BOOL tap){
			 !messageComplete ? : messageComplete();
		 }];
}

+ (void)fadeOutSuccessHUDInView:(UIView *)view withMessage:(NSString *)text compalete:(void(^)(void)) messageComplete{
	// Make toast with an image
	[view makeToast:text
		   duration:DURATION
		   position:CSToastPositionBottom
			  title:nil
			  image:[UIImage imageNamed:@"toast_sucess.png"]
			  style:nil
		 completion:^void(BOOL tap){
			 !messageComplete ? : messageComplete();
		 }];
}

+ (void)fadeOutFailHUDInView:(UIView *)view withMessage:(NSString *)text compalete:(void(^)(void)) messageComplete{
	// Make toast with an image
	[view makeToast:text
		   duration:DURATION
		   position:CSToastPositionBottom
			  title:nil
			  image:[UIImage imageNamed:@"toast_fail.png"]
			  style:nil
		 completion:^void(BOOL tap){
			 !messageComplete ? : messageComplete();
		 }];
}

+ (void)fadeOutFinishHUDInView:(UIView *)view withMessage:(NSString *)text{
	[WNHttpProcessHUD fadeOutFinishHUDInView:view withMessage:text compalete:nil];
}

+ (void)fadeOutFailHUDInView:(UIView *)view withMessage:(NSString *)text{
	[WNHttpProcessHUD fadeOutFailHUDInView:view withMessage:text compalete:nil];
}

+ (void)fadeOutSuccessHUDInView:(UIView *)view withMessage:(NSString *)text{
	[WNHttpProcessHUD fadeOutSuccessHUDInView:view withMessage:text compalete:nil];
}

+(void) processBeginInView:(UIView*)view{
	view = view ? : keyWindow;
	[view makeToastActivity:CSToastPositionCenter userInteractionEnabled:NO];
}

+(void) processFinistInView:(UIView*)view complete:(void(^)(void))complete{
	[WNHttpProcessHUD processFailInView:view message:nil processComplete:complete messageComplete:nil];
}

+(void) processSuccessInView:(UIView*)view complete:(void(^)(void))complete{
	[WNHttpProcessHUD processSuccessInView:view message:nil processComplete:complete messageComplete:nil];
}

+(void) processFailInView:(UIView*)view complete:(void(^)(void))complete{
	[WNHttpProcessHUD processFailInView:view message:nil processComplete:complete messageComplete:nil];
}


+(void) processFinishInView:(UIView*)view message:(NSString *)message processComplete:(void(^)(void)) processComplete messageComplete:(void(^)(void)) messageComplete {
	[WNHttpProcessHUD processInView:view message:message messageShowBlock:^{
		// 需要显示的提示
		[WNHttpProcessHUD fadeOutFinishHUDInView:view withMessage:message compalete:messageComplete];
	} processComplete:processComplete];
}

+(void) processFailInView:(UIView*)view message:(NSString *)message processComplete:(void(^)(void)) processComplete messageComplete:(void(^)(void)) messageComplete{
	[WNHttpProcessHUD processInView:view message:message messageShowBlock:^{
		// 需要显示的提示
		[WNHttpProcessHUD fadeOutFailHUDInView:view withMessage:message compalete:messageComplete];
	} processComplete:processComplete];
}

+(void) processSuccessInView:(UIView*)view message:(NSString *)message processComplete:(void(^)(void)) processComplete messageComplete:(void(^)(void)) messageComplete{
	[WNHttpProcessHUD processInView:view message:message messageShowBlock:^{
		// 需要显示的提示
		[WNHttpProcessHUD fadeOutSuccessHUDInView:view withMessage:message compalete:messageComplete];
	} processComplete:processComplete];
}

+ (void) processInView:(UIView *)view message:(NSString *)message messageShowBlock:(void(^)(void)) messageShowBlock processComplete:(void(^)(void)) processComplete{
	view = view ? : keyWindow;
	[view hideToastActivity];
	if(processComplete) processComplete();
	if(message!=nil && message.length!=0){
		// 显示提示
		if (messageShowBlock) {
			messageShowBlock();
		}
	}
}

@end

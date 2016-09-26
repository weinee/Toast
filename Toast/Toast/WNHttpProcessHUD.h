//
//  WNHttpProcessHUD.h
//  Toast
//
//  Created by weineeL on 16/9/26.
//
//

#import <Foundation/Foundation.h>

@interface WNHttpProcessHUD : NSObject

+ (void)fadeOutFinishHUDInView:(UIView *)view withMessage:(NSString *)text ;
+ (void)fadeOutSuccessHUDInView:(UIView *)view withMessage:(NSString *)text;
+ (void)fadeOutFailHUDInView:(UIView *)view withMessage:(NSString *)text;

+ (void)fadeOutFinishHUDInView:(UIView *)view withMessage:(NSString *)text compalete:(void(^)(void)) messageComplete;
+ (void)fadeOutSuccessHUDInView:(UIView *)view withMessage:(NSString *)text compalete:(void(^)(void)) messageComplete;
+ (void)fadeOutFailHUDInView:(UIView *)view withMessage:(NSString *)text compalete:(void(^)(void)) messageComplete;

//+(void) processBeginInView:(UIView*)view message:(NSString*) message;
+(void) processBeginInView:(UIView*)view;

+(void) processFinishInView:(UIView*)view message:(NSString *)message processComplete:(void(^)(void)) processComplete messageComplete:(void(^)(void)) messageComplete;
+(void) processFailInView:(UIView*)view message:(NSString *)message processComplete:(void(^)(void)) processComplete messageComplete:(void(^)(void)) messageComplete;
+(void) processSuccessInView:(UIView*)view message:(NSString *)message processComplete:(void(^)(void)) processComplete messageComplete:(void(^)(void)) messageComplete;

+(void) processFinistInView:(UIView*)view complete:(void(^)(void))complete;
+(void) processSuccessInView:(UIView*)view complete:(void(^)(void))complete;
+(void) processFailInView:(UIView*)view complete:(void(^)(void))complete;

//+(void) loadDataBeginInView:(UIView*)view;
//+(void) loadDataSuccessInView:(UIView*)view complete:(void(^)(void))complete;
//+(void) loadDataFailInView:(UIView*)view complete:(void(^)(void))complete;

@end

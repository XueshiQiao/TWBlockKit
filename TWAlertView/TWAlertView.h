//
//  TWAlertView.h
//  TWAlertView
//
//  Created by Joey on 13-5-14.
//  Copyright (c) 2013年 Towords. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TWAlertBlock)(void);

@interface TWAlertView : UIAlertView <UIAlertViewDelegate>

+ (void) showAlert:(NSString*)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(TWAlertBlock)cancelBlock;

+ (void) showAlert:(NSString*)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(TWAlertBlock)cancelBlock otherButtonTitles:(NSString *)otherButtonTitles otherBlock:(TWAlertBlock)otherBlock;
@end

//
//  TWAlertView.m
//  TWAlertView
//
//  Created by Joey on 13-5-14.
//  Copyright (c) 2013年 Towords. All rights reserved.
//

#import "TWAlertView.h"
#import "objc/runtime.h"

@implementation TWAlertView

static const char *cancelBlockKey = "cancelBlockKey";
static const char * otherBlockKey =  "otherBlockKey";

- (id) initWithTitle:(NSString*)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(TWAlertBlock)cancelBlock otherButtonTitles:(NSString *)otherButtonTitles otherBlock:(TWAlertBlock)otherBlock {
    
    if (self = [super initWithTitle:title message:message delegate:((cancelBlock == nil && otherBlock == nil ) ? nil : self) cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil]) {
        //make both blocks associated with self.  
        if (cancelBlock) {
            objc_setAssociatedObject(self, cancelBlockKey, cancelBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
        if (otherBlock) {
            objc_setAssociatedObject(self, otherBlockKey, otherBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }

    }
    return self;
}

+ (void) showAlert:(NSString*)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(TWAlertBlock)cancelBlock  {
    TWAlertView *alert = [[self alloc] initWithTitle:title message:message cancelButtonTitle:cancelButtonTitle cancelBlock:cancelBlock otherButtonTitles:nil otherBlock:nil];
    [alert show];
}

+ (void) showAlert:(NSString*)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(TWAlertBlock)cancelBlock otherButtonTitles:(NSString *)otherButtonTitles    otherBlock:(TWAlertBlock)otherBlock {
    TWAlertView *alert = [[self alloc] initWithTitle:title message:message cancelButtonTitle:cancelButtonTitle cancelBlock:cancelBlock otherButtonTitles:otherButtonTitles otherBlock:otherBlock];
    [alert show];
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == alertView.cancelButtonIndex) {
        TWAlertBlock cancelBlock = (TWAlertBlock)objc_getAssociatedObject(self, cancelBlockKey);
        if (cancelBlock) {
            cancelBlock();
        }
    } else {
        TWAlertBlock otherBlock = (TWAlertBlock)objc_getAssociatedObject(self, otherBlockKey);
        if (otherBlock) {
            otherBlock();
        }
    }
}

- (void) dealloc {
    objc_removeAssociatedObjects(self); //remove all associated objects
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

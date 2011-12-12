//
//  ZoomingTestAppDelegate.h
//  ZoomingTest
//
//  Created by Leonty Deriglazov on 06.12.11.
//  Copyright 2011 iOS Development School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZoomingTestViewController;

@interface ZoomingTestAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ZoomingTestViewController *viewController;

@end

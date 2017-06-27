//
//  AppDelegate.h
//  demo_MRC_ARC_BLOCK
//
//  Created by  huzhongyin on 17/6/27.
//  Copyright © 2017年 LanGe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


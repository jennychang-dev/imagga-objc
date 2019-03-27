//
//  AppDelegate.h
//  ImaggaObjcCoreData
//
//  Created by Jenny Chang on 26/03/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


//
//  AppDelegate.h
//  ThriftSnap
//
//  Created by Deftsoft iMac on 24/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Facebook.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
  Facebook*                   m_Facebook;

}
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain)UITabBarController*            tabBarController;

@property (nonatomic, retain) Facebook	 *m_Facebook;
@property (nonatomic, retain) NSMutableDictionary*	m_FacebookDataDictionary;
@property(nonatomic,retain)NSMutableString *categoryString;
@property(nonatomic,retain)NSMutableString *conditionString;
@property(nonatomic,retain)NSMutableString *deliveryString;
@property(nonatomic,retain)NSMutableString *HandlingTymString;
@property(nonatomic,retain)NSMutableArray *morePhotosArray;
@property(nonatomic,retain)NSMutableArray *tableDataArray;

@property(nonatomic)BOOL imageState;
@property(nonatomic,retain)NSMutableString *optionString;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

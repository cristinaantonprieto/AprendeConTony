//
//  AppDelegate.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//
//TFM- eLearning y redes sociales, Universidad Internacional de la Rioja. 2015.

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end


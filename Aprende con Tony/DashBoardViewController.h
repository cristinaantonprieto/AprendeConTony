//
//  DashBoardViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 1/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfiguracionUsuariosViewController.h"


@interface DashBoardViewController : UIViewController
{
    
}

@property (nonatomic, retain) NSManagedObjectContext *context;


-(void)goToConfigurarUsuariosViewController:(id)sender;

@end

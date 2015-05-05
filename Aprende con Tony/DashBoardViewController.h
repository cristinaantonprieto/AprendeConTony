//
//  DashBoardViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 1/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfiguracionUsuariosViewController.h"
#import "SeleccionUsuariosViewController.h"
#import "NuevoUsuarioViewController.h"
#import "Usuario.h"

@interface DashBoardViewController : UIViewController<UIAlertViewDelegate>
{
    
}

@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) Usuario *usuarioSeleccionado;


-(void)goToConfigurarUsuariosViewController:(id)sender;
-(void)goToSeleccionarUsuariosViewController:(id)sender;

@end

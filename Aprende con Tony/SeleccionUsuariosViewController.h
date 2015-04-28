//
//  SeleccionUsuariosViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfiguracionUsuariosViewController.h"

@interface SeleccionUsuariosViewController : UIViewController
{
    IBOutlet UIImageView *imagenFondo;
}


/** VARIABLES **/
@property (strong,nonatomic) IBOutlet UIImageView *imagenFondo;
/** METODOS **/
-(IBAction)goToConfigurarUsuariosViewController:(id)sender;

@end

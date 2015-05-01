//
//  NuevoUsuarioViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 1/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfiguracionUsuariosViewController.h"

@interface NuevoUsuarioViewController : UIViewController <UIAlertViewDelegate>
{
    IBOutlet UIButton *buttonConfigurarJuegos;
}

/** VARIABLES **/
@property (nonatomic, retain) IBOutlet UIButton *buttonConfigurarJuegos;



/** METODOS **/
-(IBAction)goToConfigurarJuegosViewController:(id)sender;
-(IBAction)goToGuardarUsuarioViewController:(id)sender;


@end







//
//  SeleccionUsuariosViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NuevoUsuarioViewController.h"

@interface SeleccionUsuariosViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    IBOutlet UIImageView *imagenFondo;
}


/** VARIABLES **/
@property (strong,nonatomic) IBOutlet UIImageView *imagenFondo;
/** METODOS **/
-(IBAction)goToNuevoUsuarioViewController:(id)sender;

@end

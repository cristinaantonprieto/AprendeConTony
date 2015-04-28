//
//  InicioAppViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeleccionUsuariosViewController.h"

@interface InicioAppViewController : UIViewController
{
    IBOutlet UIImageView *imagenFondo;
    IBOutlet UIButton *buttonPlay;
    IBOutlet UIButton *buttonConfiguracion;
    
}


/** VARIABLES **/
@property (strong,nonatomic) IBOutlet UIImageView *imagenFondo;
@property (nonatomic, retain) IBOutlet UIButton *buttonPlay;
@property (nonatomic, retain) IBOutlet UIButton *buttonConfiguracion;


/** METODOS **/
-(IBAction)goToSeleccionUsuariosViewController:(id)sender;
-(IBAction)goToConfiguracionViewController:(id)sender;

@end

//
//  InicioAppViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeleccionUsuariosViewController.h"
#import "ConfiguracionUsuariosViewController.h"

@interface InicioAppViewController : UIViewController
{
    IBOutlet UIImageView *imagenFondo;
    IBOutlet UIButton *buttonPlay;
    
    
}


/** VARIABLES **/
@property (strong,nonatomic) IBOutlet UIImageView *imagenFondo;
@property (nonatomic, retain) IBOutlet UIButton *buttonPlay;



/** METODOS **/
-(IBAction)goToSeleccionUsuariosViewController:(id)sender;


@end

//
//  IntermediaJuegoViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 7/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "IntermediaJuegoViewController.h"

@implementation IntermediaJuegoViewController

@synthesize imagenFondo, usuarioSeleccionado, context, numJuego;
@synthesize bolaUno, bolaDos,bolaTres,pictograma, temporizador, tiempoIncremento;



-(void)viewDidLoad
{
    
    self.tiempoIncremento =0;
   
    self.temporizador = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                     target:self
                                                   selector:@selector(comienzaTiempo:)
                                                   userInfo:nil
                                                    repeats:YES];
    
   
    
    [super viewDidLoad];
    
}


-(void)viewWillAppear:(BOOL)animated
{
   
    self.pictograma.hidden = YES;
    [super viewWillAppear:YES];
    
    
}

#pragma mark temporizador metodos

-(void)comienzaTiempo:(NSTimer *) elContador
{
    
    switch (self.tiempoIncremento) {
        case 0: //
            NSLog(@"incremento 0");
            self.tiempoIncremento++;
            self.bolaTres.hidden = YES;
            break;
        case 1:
              NSLog(@"incremento 1");
            self.tiempoIncremento++;
            self.bolaDos.hidden = YES;
            break;
        case 2:
              NSLog(@"incremento 2");
            self.tiempoIncremento++;
            self.bolaUno.hidden = YES;
            self.pictograma.hidden = NO;
            
           // [self.view setNeedsDisplay];
        
            break;
        case 3:
              NSLog(@"incremento 3");
             [self terminarTiempo:self.temporizador];
             self.temporizador = [NSTimer scheduledTimerWithTimeInterval:3.0
                                                                 target:self
                                                               selector:@selector(comienzaTiempo:)
                                                               userInfo:nil
                                                                repeats:NO];
            self.tiempoIncremento++;
         
              break;
        case 4:
            NSLog(@"incremento 4");
          
            [self terminarTiempo:self.temporizador];
            break;
        default:
            break;
    }
    
}



- (void)terminarTiempo:(id)sender{
    [self.temporizador invalidate];
    self.temporizador = nil;
    
    //pasar al juego......
    if(self.tiempoIncremento== 4)
    {
        NSLog(@"momento de jugar.....");

        switch (self.numJuego) {
            case 1: //juego elementos de casa
            {
                [self performSegueWithIdentifier:@"juegoCasaviewControllerSegue" sender:sender];
               
            }
                break;
            case 2: //juego cotidianas
                
                break;
            case 3: //juego modales
                
                break;
            case 4://juego emociones
                
                break;
                
            default:
                break;
        }
    }
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"juegoCasaviewControllerSegue"]) {
        
        // Get destination view
        JuegoCasaViewController *juegoCasaViewController = [segue destinationViewController];
        juegoCasaViewController.context = self.context;
        juegoCasaViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        

    }
}


- (void)reiniciarTiempo:(id)sender{
    
   
}

@end

//
//  IntermediaJuegoViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 7/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "IntermediaJuegoViewController.h"

@implementation IntermediaJuegoViewController

@synthesize imagenFondo, usuarioSeleccionado, context, numJuego, soundAhoraTu;
@synthesize bolaUno, bolaDos,bolaTres,pictograma, temporizador, tiempoIncremento, nombreNivel;



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
        {
              NSLog(@"incremento 2");
            self.tiempoIncremento++;
            self.bolaUno.hidden = YES;
            self.pictograma.hidden = NO;
            
            /*Cargar sonidos*/
            NSString *soundAhoraTuPath = [[NSBundle mainBundle] pathForResource:@"ahoraJuegaTu"
                                                                            ofType:@"aiff"];
            
            // If this file is actually in the bundle...
            if(soundAhoraTuPath) {
                // Create a file URL with this path
                NSURL *soundAhoraTuURL = [NSURL fileURLWithPath:soundAhoraTuPath];
                
                // Register sound file located at that URL as a system sound
                OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundAhoraTuURL, &soundAhoraTu);
                if(err != kAudioServicesNoError)
                    NSLog(@"Could not load %@, error code: %d", soundAhoraTuURL, (int)err);
            }
            
            
            AudioServicesPlaySystemSound(soundAhoraTu);
            
            
           // [self.view setNeedsDisplay];
        }
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
            {
                [self performSegueWithIdentifier:@"juegoCotidianasviewControllerSegue" sender:sender];
            }
            break;
            case 3: //juego modales
            {
                [self performSegueWithIdentifier:@"juegoModalesviewControllerSegue" sender:sender];
            }
                break;
            case 4://juego emociones
            {
                [self performSegueWithIdentifier:@"juegoEmocionesviewControllerSegue" sender:sender];
            }
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
        juegoCasaViewController.nombreNivel = self.nombreNivel;
        

    }
    else if ([[segue identifier] isEqualToString:@"juegoCotidianasviewControllerSegue"]) {
        
        // Get destination view
        JuegoCotidianasViewController *juegoCotidianasViewController = [segue destinationViewController];
        juegoCotidianasViewController.context = self.context;
        juegoCotidianasViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        juegoCotidianasViewController.nombreNivel = self.nombreNivel;
        
        
    }
    else if ([[segue identifier] isEqualToString:@"juegoModalesviewControllerSegue"]) {
        
        // Get destination view
        JuegoModalesViewController *juegoModalesViewController = [segue destinationViewController];
        juegoModalesViewController.context = self.context;
        juegoModalesViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        juegoModalesViewController.nombreNivel = self.nombreNivel;
        
        
    }
    else if ([[segue identifier] isEqualToString:@"juegoEmocionesviewControllerSegue"]) {
        
        // Get destination view
        JuegoEmocionesViewController *juegoEmocionesViewController = [segue destinationViewController];
        juegoEmocionesViewController.context = self.context;
        juegoEmocionesViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        juegoEmocionesViewController.nombreNivel = self.nombreNivel;
        
        
    }
    
}




@end

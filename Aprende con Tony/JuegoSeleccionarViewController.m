//
//  JuegoSeleccionarViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 9/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "JuegoSeleccionarViewController.h"

@implementation JuegoSeleccionarViewController

@synthesize usuarioSeleccionado, nombreJuego, context, numDificultad, nombreNivel;
@synthesize imagenRating, imagenTony, areaJuego, guionPictograma;
@synthesize imagenCentral, imagenCinco, imagenCuatro, imagenDos, imagenTres, imagenUno;
@synthesize numAciertos,numFallos,numImagenTocada;
@synthesize temporizadorBordeRojo, temporizadorTony, temporizadorEntreToques;

-(void)viewDidLoad
{
    
    [self cargarBotonesNavigation];
   
    self.numImagenTocada = -1;
    self.numFallos =0;
    self.numAciertos=0;
    
    
    self.areaJuego.layer.borderColor = [UIColor yellowColor].CGColor;
    self.areaJuego.layer.borderWidth = 5.0f;
    self.areaJuego.layer.cornerRadius = 15;
    self.areaJuego.layer.masksToBounds = YES;
    
    
    self.temporizadorEntreToques = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                                  target:self
                                                                selector:@selector(tiempoExcedidoEntreToques)
                                                                userInfo:nil
                                                                 repeats:NO];

    
    
    /** cargar datos segun el juego **/
    if ([nombreJuego isEqualToString:@"casa"]) {
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
#warning cargar datos segun nivel, ropa barrer o mesa, primero probamos para una cosa que sera el de ropa y dificultad 3 para pruebas
        self.numDificultad = 3; ///CAMBIARLOOOOOOOOOOO A LO QUE SEA REALMENTE
        self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelRopa numero_dificultad:self.numDificultad];
        
        [self cargarImagenesJuego];
        
        
    }else if([nombreJuego isEqualToString:@"cotidianas"])
    {
        
    }else if([nombreJuego isEqualToString:@"modales"])
    {
        
    }else if([nombreJuego isEqualToString:@"emociones"])
    {
        
    }
    
    
    
    
        
        [super viewDidLoad];
}


#pragma mark metodos de control de toques


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
            UITouch *touch = [[event allTouches] anyObject];
            CGPoint location = [touch locationInView:self.view];
            CGPoint locationAreaJuego = [touch locationInView:self.areaJuego];
    
            if(CGRectContainsPoint(self.imagenUno.frame, location)|| CGRectContainsPoint(self.imagenUno.frame, locationAreaJuego))
            {
                NSLog(@"imagen uno tocada.....");
                self.numImagenTocada = 1;
                
                
            }else if(CGRectContainsPoint(self.imagenDos.frame, location)|| CGRectContainsPoint(self.imagenDos.frame, locationAreaJuego))
            {
                NSLog(@"imagen dos tocada.....");
                self.numImagenTocada = 2;
            }else if(CGRectContainsPoint(self.imagenTres.frame, location)|| CGRectContainsPoint(self.imagenTres.frame, locationAreaJuego))
            {
                NSLog(@"imagen tres tocada.....");
                self.numImagenTocada = 3;
            }else if(CGRectContainsPoint(self.imagenCuatro.frame, location)|| CGRectContainsPoint(self.imagenCuatro.frame, locationAreaJuego))
            {
                NSLog(@"imagen cuatro tocada.....");
                self.numImagenTocada = 4;
            }else if(CGRectContainsPoint(self.imagenCinco.frame, location)|| CGRectContainsPoint(self.imagenCinco.frame, locationAreaJuego))
            {
                NSLog(@"imagen cinco tocada.....");
                self.numImagenTocada = 5;
            }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    CGPoint locationAreaJuego = [touch locationInView:self.areaJuego];
    
    NSString *imagenTocadaNombre = @"";
    
    if(CGRectContainsPoint(self.imagenUno.frame, location) || CGRectContainsPoint(self.imagenUno.frame, locationAreaJuego))
    {
        NSLog(@"imagen uno tocada ended.....");
        imagenTocadaNombre = [self.seleccionarObject.arrayPosibilidades objectAtIndex:0];
        
    }else if(CGRectContainsPoint(self.imagenDos.frame, location) || CGRectContainsPoint(self.imagenDos.frame, locationAreaJuego))
    {
        NSLog(@"imagen dos tocada ended.....");
        imagenTocadaNombre = [self.seleccionarObject.arrayPosibilidades objectAtIndex:1];
    }else if(CGRectContainsPoint(self.imagenTres.frame, location) || CGRectContainsPoint(self.imagenTres.frame, locationAreaJuego))
    {
        NSLog(@"imagen tres tocada ended.....");
        imagenTocadaNombre = [self.seleccionarObject.arrayPosibilidades objectAtIndex:2];
    }else if(CGRectContainsPoint(self.imagenCuatro.frame, location) ||CGRectContainsPoint(self.imagenCuatro.frame, locationAreaJuego))
    {
        NSLog(@"imagen cuatro tocada ended.....");
        imagenTocadaNombre = [self.seleccionarObject.arrayPosibilidades objectAtIndex:3];
    }else if(CGRectContainsPoint(self.imagenCinco.frame, location) || CGRectContainsPoint(self.imagenCinco.frame, locationAreaJuego))
    {
        NSLog(@"imagen cinco tocada ended.....");
        imagenTocadaNombre = [self.seleccionarObject.arrayPosibilidades objectAtIndex:4];
    }
    
    
    
    NSLog(@"imagen tocada = %@", imagenTocadaNombre);
    [self comprobarAccion:imagenTocadaNombre];
}

-(void)comprobarAccion:(NSString *)imagenTocada
{
    //comprobamos que la imagen tocada es una de las opciones del array de opciones correctas.
    
    if ([self.seleccionarObject.arrayCorrectas containsObject: imagenTocada])
    {
        
        /** accion correcta **/
     
        //imagen tony
        UIImage *imagTony = [UIImage imageNamed:@"tonyContento.png"];
        [self.imagenTony setImage:imagTony];
        
        
        [self.view setUserInteractionEnabled:NO];
        [self.areaJuego setUserInteractionEnabled:NO];
        self.temporizadorTony = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                                      target:self
                                                                    selector:@selector(cambiarImagenTony)
                                                                    userInfo:nil
                                                                     repeats:NO];
        
        
        switch (self.numImagenTocada) {
            case 1:
                self.imagenUno.hidden =YES;
                break;
            case 2:
                self.imagenDos.hidden =YES;
                break;
            case 3:
                self.imagenTres.hidden=YES;
                break;
            case 4:
                self.imagenCuatro.hidden=YES;
                break;
            case 5:
                self.imagenCinco.hidden=YES;
                break;
            default:
                break;
        }
       
        self.numAciertos++;
        if (self.numAciertos == 3) {
            //ha finalizado el nivel REALIZAR UNA DETERMINADA ACCION
            
            //imagen rating
            UIImage *imagRating = [UIImage imageNamed:@"ratinguno.png"];
            [self.imagenRating setImage:imagRating];
            
        }
    }else
    {
        /** accion incorrecta **/
        self.numFallos++;
        
        
        [self.view setUserInteractionEnabled:NO];
        [self.areaJuego setUserInteractionEnabled:NO];
        self.temporizadorBordeRojo = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                             target:self
                                                           selector:@selector(quitarBorde)
                                                           userInfo:nil
                                                            repeats:NO];
        switch (self.numImagenTocada) {
            case 1:
                self.imagenUno.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenUno.layer.borderWidth = 5.0f;
                self.imagenUno.layer.cornerRadius = 15;
                self.imagenUno.layer.masksToBounds = YES;
                break;
            case 2:
                
                self.imagenDos.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenDos.layer.borderWidth = 5.0f;
                self.imagenDos.layer.cornerRadius = 15;
                self.imagenDos.layer.masksToBounds = YES;
                break;
            case 3:
                
                self.imagenTres.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenTres.layer.borderWidth = 5.0f;
                self.imagenTres.layer.cornerRadius = 15;
                self.imagenTres.layer.masksToBounds = YES;
                break;
            case 4:
               
                self.imagenCuatro.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenCuatro.layer.borderWidth = 5.0f;
                self.imagenCuatro.layer.cornerRadius = 15;
                self.imagenCuatro.layer.masksToBounds = YES;
                break;
            case 5:
               
                self.imagenCinco.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenCinco.layer.borderWidth = 5.0f;
                self.imagenCinco.layer.cornerRadius = 15;
                self.imagenCinco.layer.masksToBounds = YES;
                break;
            default:
                break;
        }

    
        
        //REALIZAR ACCION CORRESPONDIENTE
        
        
        
    }
}


#pragma mark metodos shake imagenes
-(void)shakeView:(UIImageView *)imagen {
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    [shake setDuration:0.2];
    [shake setRepeatCount:7];
    [shake setAutoreverses:YES];
    [shake setFromValue:[NSValue valueWithCGPoint:
                         CGPointMake(imagen.center.x - 5,imagen.center.y)]];
    [shake setToValue:[NSValue valueWithCGPoint:
                       CGPointMake(imagen.center.x + 5, imagen.center.y)]];
    [imagen.layer addAnimation:shake forKey:@"position"];
}

#pragma mark metodos de los temporizadores

-(void)tiempoExcedidoEntreToques{
    
    [self.temporizadorBordeRojo invalidate];
    self.temporizadorBordeRojo =nil;
    
    self.numFallos++;
    if (self.numFallos<3) {
  
        NSLog(@"tiempo entre toques excedido...");
    self.temporizadorEntreToques = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                                    target:self
                                                                  selector:@selector(tiempoExcedidoEntreToques)
                                                                  userInfo:nil
                                                                   repeats:NO];
        
        //movemos imagenes a tocar correctas
        for (NSString *correcta in self.seleccionarObject.arrayPosibilidadesIndices) {
           
            if ([correcta isEqualToString:@"1"]) {
               [self shakeView:self.imagenUno];
                
            }
            if ([correcta isEqualToString:@"2"]) {
                [self shakeView:self.imagenDos];
            }
            if ([correcta isEqualToString:@"3"]) {
                [self shakeView:self.imagenTres];
            }
            if ([correcta isEqualToString:@"4"]) {
                [self shakeView:self.imagenCuatro];
            }
            if ([correcta isEqualToString:@"5"]) {
                [self shakeView:self.imagenCinco];
            }
           
        }

        
    }else if(self.numFallos==3)
    {
        [self.temporizadorBordeRojo invalidate];
        self.temporizadorBordeRojo =nil;
        NSLog(@"tiempo entre toques excedido y maximo numero de fallos cumplido");
 #warning reducir dificultad y poner contador de numfallos a cero.
    }
    
}

-(void)quitarBorde
{
    switch (self.numImagenTocada) {
        case 1:
            self.imagenUno.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenUno.layer.masksToBounds = YES;
            break;
        case 2:
            
            self.imagenDos.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenDos.layer.masksToBounds = YES;
            break;
        case 3:
            
            self.imagenTres.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenTres.layer.masksToBounds = YES;
            break;
        case 4:
            
            self.imagenCuatro.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenCuatro.layer.masksToBounds = YES;
            break;
        case 5:
            
            self.imagenCinco.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenCinco.layer.masksToBounds = YES;
            break;
        default:
            break;
    }
    
    [self.view setUserInteractionEnabled:YES];
    [self.areaJuego setUserInteractionEnabled:YES];
    
    [self.temporizadorBordeRojo invalidate];
    self.temporizadorBordeRojo =nil;

}

-(void)cambiarImagenTony
{
    
    [self.view setUserInteractionEnabled:YES];
    [self.areaJuego setUserInteractionEnabled:YES];
    
    [self.temporizadorTony invalidate];
    self.temporizadorTony =nil;

    //imagen tony
    UIImage *imagTony = [UIImage imageNamed:@"tonyPregunta.png"];
    [self.imagenTony setImage:imagTony];
}


#pragma mark metodos de carga de pantalla

-(void)cargarBotonesNavigation
{
    /** FIJAR BOTON CONFIGURACION EN BARRA DE NAVEGACIÓN **/
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"configuracionItem.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goToConfigurarUsuariosViewController:)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButton;
    
    /** FIJAR BOTON HOME EN BARRA DE NAVEGACIÓN **/
    UIButton *buttonHome =  [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonHome setImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [buttonHome addTarget:self action:@selector(goToSeleccionarUsuariosViewController:)forControlEvents:UIControlEventTouchUpInside];
    [buttonHome setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButtonH = [[UIBarButtonItem alloc] initWithCustomView:buttonHome];
    self.navigationItem.leftBarButtonItem = barButtonH;
}

-(void)cargarImagenesJuego
{
    
    //imagen central
    UIImage *imagencentral = [UIImage imageNamed:self.seleccionarObject.nombreImagenCentral];
    [self.imagenCentral setImage:imagencentral];
    
    
    //imagen posibilidad uno
    NSString *imagen_uno = [self.seleccionarObject.arrayPosibilidades objectAtIndex:0];
    UIImage *imagenuno = [UIImage imageNamed:imagen_uno];
    [self.imagenUno setImage:imagenuno];
     
    //imagen posibilidad dos
    NSString *imagen_dos=[self.seleccionarObject.arrayPosibilidades objectAtIndex:1];
    UIImage *imagendos = [UIImage imageNamed:imagen_dos];
    [self.imagenDos setImage:imagendos];
     
    //imagen posibilidad tres
    NSString *imagen_tres=[self.seleccionarObject.arrayPosibilidades objectAtIndex:2];
    UIImage *imagentres = [UIImage imageNamed:imagen_tres];
    [self.imagenTres setImage:imagentres];
    
    //imagen posibilidad cuatro
     if (numDificultad==2 || numDificultad==3) {
    NSString *imagen_cuatro=[self.seleccionarObject.arrayPosibilidades objectAtIndex:3];
    UIImage *imagencuatro = [UIImage imageNamed:imagen_cuatro];
    [self.imagenCuatro setImage:imagencuatro];
     }
    
    //imagen posibilidad cinco
    if (self.numDificultad==3) {
        NSString *imagen_cinco=[self.seleccionarObject.arrayPosibilidades objectAtIndex:4];
        UIImage *imagencinco = [UIImage imageNamed:imagen_cinco];
        [self.imagenCinco setImage:imagencinco];
    }

  
    if(self.numDificultad == 2)
    {
        self.imagenCinco.hidden = YES;
        
    }else if (self.numDificultad ==1) //dificultad menor
    {
        self.imagenCuatro.hidden = YES;
        self.imagenCinco.hidden = YES;
    }
    

}

#pragma mark metodos botones navigation bar

-(void)goToConfigurarUsuariosViewController:(id)sender
{
    
    NSLog(@"go to configurar usuarios view controller...");
    
    /** mostramos el alert que pide la contraseña **/
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Introduce la contraseña:"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Aceptar"
                                            otherButtonTitles:nil];
    
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    [message show];
}

-(void)goToSeleccionarUsuariosViewController:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    SeleccionUsuariosViewController *seleccionUsuariosViewController = [storyBoard instantiateViewControllerWithIdentifier:@"seleccionUsuariosViewControllerID"];
    seleccionUsuariosViewController.context = self.context;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:seleccionUsuariosViewController animated:YES];
}


#pragma mark alertView delegate methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    
    NSLog(@"password introducida: %@", inputText);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // obtenemos el nombre desde la base de datos
    NSString *password = [defaults stringForKey:@"kPassword"];
    
    //si la clave coincide pasamos a la siguiente pantalla
    if ([inputText isEqualToString:password]) {
        // Llamamos al storyBoard principal
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        NuevoUsuarioViewController *nuevoUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"nuevoUsuarioViewControllerID"];
        nuevoUsuarioViewController.context = self.context;
        nuevoUsuarioViewController.nuevoUsuario = NO;
        nuevoUsuarioViewController.persona = self.usuarioSeleccionado;
        
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:nuevoUsuarioViewController animated:YES];
    }
    
    
    
}


@end

//
//  JuegoEmparejarViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 12/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "JuegoEmparejarViewController.h"

@interface JuegoEmparejarViewController ()

@end

@implementation JuegoEmparejarViewController

@synthesize juegoCasa, nombreJuego, nombreNivel, juegoModales, juegoEmociones, juegoCotidianas;
@synthesize context, usuarioSeleccionado, numDificultad, numAciertos, numFallos, numImagenTocada;
@synthesize imagenRating, imagenTony, areaJuego, guionPictograma;
@synthesize imagenCentral, imagenCuatro, imagenTres, imagenDos, imagenUno, bienArrastrada, accionCorrecta;
@synthesize temporizadorBordeRojo, temporizadorEntreToquesEmparejar, temporizadorTony, tiempoImagenFinNivel;
@synthesize tiempoTotalEmparejar, contadorTiempoTotalEmparejar, soundBien, soundArrastra, soundAplausos;

- (void)viewDidLoad {
    
    self.numDificultad = self.juegoCasa.num_dificultad.intValue;
    NSLog(@" view did load numdificultad = %d", self.numDificultad);
    
    NSLog(@"user = %@", self.usuarioSeleccionado.nombre);
    
    
    self.contadorTiempoTotalEmparejar = 0;
    
    self.tiempoTotalEmparejar = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countupEmparejar) userInfo:nil repeats:YES];
    
    
    self.areaJuego.layer.borderColor = [UIColor yellowColor].CGColor;
    self.areaJuego.layer.borderWidth = 5.0f;
    self.areaJuego.layer.cornerRadius = 15;
    self.areaJuego.layer.masksToBounds = YES;
    
    self.numImagenTocada = -1;
    self.numFallos =0;
    self.numAciertos=0;
    self.bienArrastrada = NO;
    self.accionCorrecta = NO;
    
    
    /*Cargar sonidos*/
    NSString *soundArrastraPath = [[NSBundle mainBundle] pathForResource:@"arrastra"
                                                                ofType:@"aiff"];
    
    // If this file is actually in the bundle...
    if(soundArrastraPath) {
        // Create a file URL with this path
        NSURL *soundArrastraURL = [NSURL fileURLWithPath:soundArrastraPath];
        
        // Register sound file located at that URL as a system sound
        OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundArrastraURL, &soundArrastra);
        if(err != kAudioServicesNoError)
            NSLog(@"Could not load %@, error code: %d", soundArrastraURL, (int)err);
    }
    
    NSString *soundBienPath = [[NSBundle mainBundle] pathForResource:@"acierto"
                                                              ofType:@"aiff"];
    
    // If this file is actually in the bundle...
    if(soundBienPath) {
        // Create a file URL with this path
        NSURL *soundBienURL = [NSURL fileURLWithPath:soundBienPath];
        
        // Register sound file located at that URL as a system sound
        OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundBienURL, &soundBien);
        if(err != kAudioServicesNoError)
            NSLog(@"Could not load %@, error code: %d", soundBienPath, (int)err);
    }
    
    /*Cargar sonidos*/
    NSString *soundAplausoPath = [[NSBundle mainBundle] pathForResource:@"aplausos"
                                                                 ofType:@"aiff"];
    
    // If this file is actually in the bundle...
    if(soundAplausoPath) {
        // Create a file URL with this path
        NSURL *soundAplausoURL = [NSURL fileURLWithPath:soundAplausoPath];
        
        // Register sound file located at that URL as a system sound
        OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundAplausoURL, &soundAplausos);
        if(err != kAudioServicesNoError)
            NSLog(@"Could not load %@, error code: %d", soundAplausoURL, (int)err);
    }
    
    

    
    
    
    [self cargarVistaDelJuego];
    
    
    [super viewDidLoad];
    

}

-(void)viewWillDisappear:(BOOL)animated
{
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }
    
    
}

-(void)countupEmparejar
{
    //metodo para contabilizar el tiempo de juego
    self.contadorTiempoTotalEmparejar = self.contadorTiempoTotalEmparejar+1;
}

-(void)cargarVistaDelJuego
{
    NSLog(@"cargar vista del juego...");
    
    self.temporizadorEntreToquesEmparejar = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                                    target:self
                                                                  selector:@selector(tiempoExcedidoEntreToquesEmparejar)
                                                                  userInfo:nil
                                                                   repeats:NO];
    
    
    
    /** cargar datos segun el juego **/
    if ([nombreJuego isEqualToString:@"casa"]) {
        
        if (self.usuarioSeleccionado.usuario_juegoCasa.voz.intValue == 1) {
            // poner SONIDO
            AudioServicesPlaySystemSound(soundArrastra);

        }
        if (self.usuarioSeleccionado.usuario_juegoCasa.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoCasa.num_dificultad.intValue;
          NSLog(@"numdificultad = %d", self.numDificultad);
        
        switch (self.juegoCasa.num_nivel.intValue) {
            case 1:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpRopa numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpBarrer numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpMesa numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuego];
        
        
    }else if([nombreJuego isEqualToString:@"cotidianas"])
    {
        if (self.usuarioSeleccionado.usuario_juegoCotidianas.voz.intValue == 1) {
            // poner SONIDO
            AudioServicesPlaySystemSound(soundArrastra);

        }
        if (self.usuarioSeleccionado.usuario_juegoCotidianas.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoCotidianas.num_dificultad.intValue;
        
        
        switch (self.juegoCotidianas.num_nivel.intValue) {
            case 1:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpMaleta numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpDientes numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpCine numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuego];
        
    }else if([nombreJuego isEqualToString:@"modales"])
    {
        if (self.usuarioSeleccionado.usuario_juegoModales.voz.intValue == 1) {
            // poner SONIDO
            AudioServicesPlaySystemSound(soundArrastra);

        }
        if (self.usuarioSeleccionado.usuario_juegoModales.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoModales.num_dificultad.intValue;
        
        
        switch (self.juegoModales.num_nivel.intValue) {
            case 1:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpLavarManos numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpMocos numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpPapel numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuego];
        
    }else if([nombreJuego isEqualToString:@"emociones"])
    {
        if (self.usuarioSeleccionado.usuario_juegoEmociones.voz.intValue == 1) {
            // poner SONIDO
            AudioServicesPlaySystemSound(soundArrastra);

        }
        if (self.usuarioSeleccionado.usuario_juegoEmociones.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoEmociones.num_dificultad.intValue;
        
        
        switch (self.juegoEmociones.num_nivel.intValue) {
            case 1:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpContento numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpTriste numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.emparejarObject = [[EmparejarObject alloc]initWithInstruccion:NombreNivelEmpAsustado numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuego];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark metodos de carga de pantalla

-(void)cargarBotonesNavigation
{
    /** FIJAR BOTON GAMES EN BARRA DE NAVEGACIÓN **/
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"games.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goToDashViewController:)forControlEvents:UIControlEventTouchUpInside];
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
    UIImage *imagencentral = [UIImage imageNamed:self.emparejarObject.nombreImagenCentral];
    [self.imagenCentral setImage:imagencentral];
    
    
    if (self.numDificultad == 3) {
        
        
        //imagen posibilidad uno
        NSString *imagen_uno = [self.emparejarObject.arrayPosibilidades objectAtIndex:0];
        UIImage *imagenuno = [UIImage imageNamed:imagen_uno];
        [self.imagenUno setImage:imagenuno];
        
        //imagen posibilidad dos
        NSString *imagen_dos=[self.emparejarObject.arrayPosibilidades objectAtIndex:1];
        UIImage *imagendos = [UIImage imageNamed:imagen_dos];
        [self.imagenDos setImage:imagendos];
        
        //imagen posibilidad tres
        NSString *imagen_tres=[self.emparejarObject.arrayPosibilidades objectAtIndex:2];
        UIImage *imagentres = [UIImage imageNamed:imagen_tres];
        [self.imagenTres setImage:imagentres];
        
        
    }else if(self.numDificultad == 2)
    {
        if (!self.imagenUno.hidden) {
            self.imagenUno.hidden = YES;
        }
        
        
        //imagen posibilidad dos
        NSString *imagen_dos=[self.emparejarObject.arrayPosibilidades objectAtIndex:0];
        UIImage *imagendos = [UIImage imageNamed:imagen_dos];
        [self.imagenDos setImage:imagendos];
        //imagen posibilidad tres
        NSString *imagen_tres=[self.emparejarObject.arrayPosibilidades objectAtIndex:1];
        UIImage *imagentres = [UIImage imageNamed:imagen_tres];
        [self.imagenTres setImage:imagentres];
        
        
        
    }else if (self.numDificultad ==1) //dificultad menor
    {
        if (!self.imagenUno.hidden) {
            self.imagenUno.hidden = YES;
        }
        if (!self.imagenTres.hidden) {
            self.imagenTres.hidden = YES;
        }
        
        
        //imagen posibilidad dos
        NSString *imagen_dos=[self.emparejarObject.arrayPosibilidades objectAtIndex:0];
        UIImage *imagendos = [UIImage imageNamed:imagen_dos];
        [self.imagenDos setImage:imagendos];
        
        
    }
    
    
}

#pragma mark metodos botones navigation bar

-(void)goToDashViewController:(id)sender
{
    
    
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
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // obtenemos el nombre desde la base de datos
    NSString *password = [defaults stringForKey:@"kPassword"];
    
    //si la clave coincide pasamos a la siguiente pantalla
    if ([inputText isEqualToString:password]) {
        // Llamamos al storyBoard principal
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        DashBoardViewController *dashboardViewController = [storyBoard instantiateViewControllerWithIdentifier:@"dashBoardViewControllerID"];
        dashboardViewController.context = self.context;
        dashboardViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:dashboardViewController animated:YES];
        
    }
    
    
    
}


#pragma mark metodos de control de toques


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    CGPoint locationAreaJuego = [touch locationInView:self.areaJuego];
    
    
    if(CGRectContainsPoint(self.imagenUno.frame, location)|| CGRectContainsPoint(self.imagenUno.frame, locationAreaJuego))
    {
        
        self.numImagenTocada = 1;
        
        
    }else if(CGRectContainsPoint(self.imagenDos.frame, location)|| CGRectContainsPoint(self.imagenDos.frame, locationAreaJuego))
    {
        
        self.numImagenTocada = 2;
    }else if(CGRectContainsPoint(self.imagenTres.frame, location)|| CGRectContainsPoint(self.imagenTres.frame, locationAreaJuego))
    {
        
        self.numImagenTocada = 3;
    }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
        CGPoint posicionToqueMoved = [[touches anyObject] locationInView:self.areaJuego];
        CGPoint posicionToque = [[touches anyObject] previousLocationInView:[self areaJuego]];
        
        float xDif = posicionToqueMoved.x - posicionToque.x;
        float yDif = posicionToqueMoved.y - posicionToque.y;
    
    
    switch (self.numImagenTocada) {
        case 1:
        {
            CGAffineTransform translate = CGAffineTransformMakeTranslation(xDif, yDif);
            self.imagenUno.transform = CGAffineTransformConcat(self.imagenUno.transform, translate);
        }
            break;
        case 2:
        {
            CGAffineTransform translate = CGAffineTransformMakeTranslation(xDif, yDif);
            self.imagenDos.transform = CGAffineTransformConcat(self.imagenDos.transform, translate);
        }
            break;
        case 3:
        {
            CGAffineTransform translate = CGAffineTransformMakeTranslation(xDif, yDif);
            self.imagenTres.transform = CGAffineTransformConcat(self.imagenTres.transform, translate);
        }
            break;
        default:
            break;
    }
    
 

    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    CGPoint locationAreaJuego = [touch locationInView:self.areaJuego];
    
    NSString *imagenTocadaNombre = @"";
    
    switch (self.numDificultad) {
        case 3:
        {
            if(CGRectContainsPoint(self.imagenUno.frame, location) || CGRectContainsPoint(self.imagenUno.frame, locationAreaJuego))
            {
                NSLog(@"imagen uno tocada ended.....");
                imagenTocadaNombre = [self.emparejarObject.arrayPosibilidades objectAtIndex:0];
                
            }else if(CGRectContainsPoint(self.imagenDos.frame, location) || CGRectContainsPoint(self.imagenDos.frame, locationAreaJuego))
            {
                NSLog(@"imagen dos tocada ended.....");
                imagenTocadaNombre = [self.emparejarObject.arrayPosibilidades objectAtIndex:1];
            }else if(CGRectContainsPoint(self.imagenTres.frame, location) || CGRectContainsPoint(self.imagenTres.frame, locationAreaJuego))
            {
                NSLog(@"imagen tres tocada ended.....");
                imagenTocadaNombre = [self.emparejarObject.arrayPosibilidades objectAtIndex:2];
            }
        }
            break;
        case 2:
        {
            if(CGRectContainsPoint(self.imagenTres.frame, location) || CGRectContainsPoint(self.imagenTres.frame, locationAreaJuego))
            {
                NSLog(@"imagen uno tocada ended.....");
                imagenTocadaNombre = [self.emparejarObject.arrayPosibilidades objectAtIndex:1];
                
            }else if(CGRectContainsPoint(self.imagenDos.frame, location) || CGRectContainsPoint(self.imagenDos.frame, locationAreaJuego))
            {
                NSLog(@"imagen dos tocada ended.....");
                imagenTocadaNombre = [self.emparejarObject.arrayPosibilidades objectAtIndex:0];
            }
        }
            break;
        case 1:
        {
            if(CGRectContainsPoint(self.imagenDos.frame, location) || CGRectContainsPoint(self.imagenDos.frame, locationAreaJuego))
            {
                NSLog(@"imagen uno tocada ended.....");
                imagenTocadaNombre = [self.emparejarObject.arrayPosibilidades objectAtIndex:0];
                
            }
        }
            break;
            
        default:
            break;
    }
    
    
    NSLog(@"imagen tocada = %@", imagenTocadaNombre);
    [self comprobarAccion:imagenTocadaNombre];
    
    
  
    
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}


-(void)comprobarAccion:(NSString *)imagenTocada
{
    //comprobamos que la imagen tocada es una de las opciones del array de opciones correctas.
    NSLog(@"imagen tocada = %@       string correcta = %@", imagenTocada, self.emparejarObject.stringCorrecta);
    
    //**COMPROBAR BIEN ARRASTRADA O NO LA IMAGEN**//
    self.bienArrastrada = NO;
    self.accionCorrecta = NO;
    
    if (CGRectContainsRect( [self.imagenCuatro frame],[self.imagenUno frame] ))
    {
        self.bienArrastrada = YES;
    }else if (CGRectContainsRect ( [self.imagenCuatro frame], [self.imagenDos frame] ))
    {
        self.bienArrastrada = YES;
    }else if (CGRectContainsRect ( [self.imagenCuatro frame], [self.imagenTres frame] ))
    {
        self.bienArrastrada = YES;
    }
    
    
    if ([self.emparejarObject.stringCorrecta isEqualToString: imagenTocada])
    {
        /** accion correcta **/
        self.accionCorrecta = YES;
        
    }
    //**COMPROBAR IMAGEN TOCADA**//
    if ([self.emparejarObject.stringCorrecta isEqualToString: imagenTocada] && self.bienArrastrada)
    {
        
        [self.temporizadorEntreToquesEmparejar invalidate];
        self.temporizadorEntreToquesEmparejar=nil;
        
        //imagen tony
        UIImage *imagTony = [UIImage imageNamed:@"tonyContento.png"];
        [self.imagenTony setImage:imagTony];
        
        
        [self.view setUserInteractionEnabled:NO];
        [self.areaJuego setUserInteractionEnabled:NO];
        self.temporizadorTony = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                                 target:self
                                                               selector:@selector(cambiarImagenTonyEmparejar)
                                                               userInfo:nil
                                                                repeats:NO];
      
        
        //**poner borde verde**/
        self.temporizadorBordeRojo = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                                      target:self
                                                                    selector:@selector(quitarBorde)
                                                                    userInfo:nil
                                                                     repeats:NO];
        
        
        switch (self.numImagenTocada) {
            case 1:
            {
                self.imagenUno.layer.borderColor = [UIColor greenColor].CGColor;
                self.imagenUno.layer.borderWidth = 5.0f;
                self.imagenUno.layer.cornerRadius = 15;
                self.imagenUno.layer.masksToBounds = YES;
                
            }
                break;
            case 2:
            {
                
                self.imagenDos.layer.borderColor = [UIColor greenColor].CGColor;
                self.imagenDos.layer.borderWidth = 5.0f;
                self.imagenDos.layer.cornerRadius = 15;
                self.imagenDos.layer.masksToBounds = YES;
                
            }
                break;
            case 3:
            {
                
                self.imagenTres.layer.borderColor = [UIColor greenColor].CGColor;
                self.imagenTres.layer.borderWidth = 5.0f;
                self.imagenTres.layer.cornerRadius = 15;
                self.imagenTres.layer.masksToBounds = YES;
                
            }
                break;
                
            default:
                break;
        }

        
        //****/
        
            self.numAciertos++;
            AudioServicesPlaySystemSound(soundBien);
            
            //imagen rating
            UIImage *imagRating = [UIImage imageNamed:@"ratingtres.png"];
            [self.imagenRating setImage:imagRating];
            
            
            
            if (self.numAciertos == 1) {
                //ha finalizado el nivel REALIZAR UNA DETERMINADA ACCION: cambio de nivel o juego
                
                
                //guardamos datos
                NSError *error;
                if (![self.context save:&error]) {
                    NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                    exit(-1);
                }
                
                
                /**  cambio de nivel el usuario lo ha superado correctamente**/
                self.tiempoImagenFinNivel = [NSTimer scheduledTimerWithTimeInterval:4.0
                                                                             target:self
                                                                           selector:@selector(cambioDeNivelAccionEmparejar)
                                                                           userInfo:nil
                                                                            repeats:NO];
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
            {
                if (!self.accionCorrecta)
                {
                self.imagenUno.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenUno.layer.borderWidth = 5.0f;
                self.imagenUno.layer.cornerRadius = 15;
                self.imagenUno.layer.masksToBounds = YES;
                }
                
                /////////// Animacion volver imagen al inicio
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
                [UIView setAnimationBeginsFromCurrentState:YES];
                [UIView setAnimationDuration:1.0];
                self.imagenUno.transform = CGAffineTransformIdentity;
                [UIView setAnimationDelegate:self];
                /////[UIView setAnimationDidStopSelector:@selector(deshacerDifuminar:finished:context:)];
                
                [UIView commitAnimations];
                //////////////
                
            }
                break;
            case 2:
            {
                if (!self.accionCorrecta)
                {
                self.imagenDos.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenDos.layer.borderWidth = 5.0f;
                self.imagenDos.layer.cornerRadius = 15;
                self.imagenDos.layer.masksToBounds = YES;
                }
                
                /////////// Animacion volver imagen al inicio
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
                [UIView setAnimationBeginsFromCurrentState:YES];
                [UIView setAnimationDuration:1.0];
                self.imagenDos.transform = CGAffineTransformIdentity;
                [UIView setAnimationDelegate:self];
                /////[UIView setAnimationDidStopSelector:@selector(deshacerDifuminar:finished:context:)];
                
                [UIView commitAnimations];
                //////////////
                

            }
                break;
            case 3:
            {
                if (!self.accionCorrecta)
                {
                self.imagenTres.layer.borderColor = [UIColor redColor].CGColor;
                self.imagenTres.layer.borderWidth = 5.0f;
                self.imagenTres.layer.cornerRadius = 15;
                self.imagenTres.layer.masksToBounds = YES;
                }
                
                /////////// Animacion volver imagen al inicio
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
                [UIView setAnimationBeginsFromCurrentState:YES];
                [UIView setAnimationDuration:1.0];
                self.imagenTres.transform = CGAffineTransformIdentity;
                [UIView setAnimationDelegate:self];
                /////[UIView setAnimationDidStopSelector:@selector(deshacerDifuminar:finished:context:)];
                
                [UIView commitAnimations];
                //////////////
            }
                break;
            
            default:
                break;
        }
        
        if (numFallos == 5) { //Se permiten 5 fallos antes de cambiar de dificultad automaticamente
            
            if (self.numDificultad>1) {
                self.numDificultad--;
                
            }
            
            
            
            [self.temporizadorEntreToquesEmparejar invalidate];
            self.temporizadorEntreToquesEmparejar=nil;
         
            
            
            if ([self.nombreJuego isEqualToString:@"casa"]) {
                int numfallostotales = self.juegoCasa.num_fallos_seleccionar.intValue + self.numFallos;
                self.numFallos =0;
                [self.juegoCasa setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                [self.juegoCasa setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
                
            }
            else if ([self.nombreJuego isEqualToString:@"cotidianas"]) {
                int numfallostotales = self.juegoCotidianas.num_fallos_seleccionar.intValue + self.numFallos;
                self.numFallos =0;
                [self.juegoCotidianas setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                [self.juegoCotidianas setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
                
                
            }
            else if ([self.nombreJuego isEqualToString:@"emociones"]) {
                int numfallostotales = self.juegoEmociones.num_fallos_seleccionar.intValue + self.numFallos;
                self.numFallos =0;
                [self.juegoEmociones setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                [self.juegoEmociones setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
                
                
            }
            else if ([self.nombreJuego isEqualToString:@"modales"]) {
                int numfallostotales = self.juegoModales.num_fallos_seleccionar.intValue + self.numFallos;
                self.numFallos =0;
                [self.juegoModales setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                [self.juegoModales setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
                
                
            }
            
            
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            
            [self cargarVistaDelJuego];
           
            
            
        }
        
        //REALIZAR ACCION CORRESPONDIENTE
        NSError *error;
        if (![self.context save:&error]) {
            NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
            exit(-1);
        }
        
        
        
    }
    
    
}


#pragma mark temporizadores

-(void)tiempoExcedidoEntreToquesEmparejar{
    
    [self.temporizadorBordeRojo invalidate];
    self.temporizadorBordeRojo =nil;
    
    
    self.numFallos++;
    
    
    
    if (self.numFallos<5) {
        
        NSLog(@"tiempo entre toques excedido seleccionar view controller...");
        self.temporizadorEntreToquesEmparejar = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                                        target:self
                                                                      selector:@selector(tiempoExcedidoEntreToquesEmparejar)
                                                                      userInfo:nil
                                                                       repeats:NO];
        
        //movemos imagenes a tocar correctas
        NSString *correcta = self.emparejarObject.stringIndiceCorrecto;
        
        switch (self.numDificultad) {
            case 1:
            {
                
              [self shakeView:self.imagenDos];
            }
                break;
            case 2:
            {
                
                if ([correcta isEqualToString:@"1"]) {
                    [self shakeView:self.imagenDos];
                    
                }
                if ([correcta isEqualToString:@"2"]) {
                    [self shakeView:self.imagenTres];
                }
               
            }
                break;
            case 3:
            {
                
                if ([correcta isEqualToString:@"1"]) {
                    [self shakeView:self.imagenUno];
                    
                }
                if ([correcta isEqualToString:@"2"]) {
                    [self shakeView:self.imagenDos];
                }
                if ([correcta isEqualToString:@"3"]) {
                    [self shakeView:self.imagenTres];
                }
            }
                break;
                
            default:
                break;
        }
        
            
            
        
        
        
    }else if(self.numFallos==5)
    {
        [self.temporizadorBordeRojo invalidate];
        self.temporizadorBordeRojo =nil;
        NSLog(@"tiempo entre toques excedido y maximo numero de fallos cumplido");
        
        if (numFallos == 5) { //Se permiten 5 fallos antes de cambiar de dificultad automaticamente
            
            if (self.numDificultad>1) {
                self.numDificultad--;
                
            }
            
            [self.temporizadorEntreToquesEmparejar invalidate];
            self.temporizadorEntreToquesEmparejar=nil;
            
            
            
            if ([self.nombreJuego isEqualToString:@"casa"]) {
                [self.juegoCasa setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                int numfallostotales = self.juegoCasa.num_fallos_seleccionar.intValue + self.numFallos;
                [self.juegoCasa setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
            }
            else if ([self.nombreJuego isEqualToString:@"cotidianas"]) {
                [self.juegoCotidianas setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                int numfallostotales = self.juegoCotidianas.num_fallos_seleccionar.intValue + self.numFallos;
                [self.juegoCotidianas setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
            }
            else if ([self.nombreJuego isEqualToString:@"modales"]) {
                [self.juegoModales setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                int numfallostotales = self.juegoModales.num_fallos_seleccionar.intValue + self.numFallos;
                [self.juegoModales setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
            }
            else if ([self.nombreJuego isEqualToString:@"emociones"]) {
                [self.juegoEmociones setNum_dificultad:[NSNumber numberWithInt:self.numDificultad]];
                int numfallostotales = self.juegoEmociones.num_fallos_seleccionar.intValue + self.numFallos;
                [self.juegoEmociones setNum_fallos_seleccionar:[NSNumber numberWithInt:numfallostotales]];
            }
            
            
            
            self.numFallos =0;
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            if (self.numDificultad>1) {
                [self cargarVistaDelJuego];
            }
            
            
        }
        
        //REALIZAR ACCION CORRESPONDIENTE
        NSError *error;
        if (![self.context save:&error]) {
            NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
            exit(-1);
        }
        
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
        
        default:
            break;
    }
    
    [self.view setUserInteractionEnabled:YES];
    [self.areaJuego setUserInteractionEnabled:YES];
    
    [self.temporizadorBordeRojo invalidate];
    self.temporizadorBordeRojo =nil;
    
}

#pragma mark cambio de nivel metodos

-(void)cambioDeNivelAccionEmparejar
{
    
    [self.tiempoImagenFinNivel invalidate];
    self.tiempoImagenFinNivel=nil;
    
    
    
    UIImageView *brickAnim = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"finNivelBien.png"]];
    brickAnim.frame = self.view.frame;
    [self.view addSubview:brickAnim];
    
    AudioServicesPlaySystemSound(soundAplausos);
    
    [self.tiempoImagenFinNivel invalidate];
    self.tiempoImagenFinNivel = nil;
    self.tiempoImagenFinNivel = [NSTimer scheduledTimerWithTimeInterval:7.0
                                                                 target:self
                                                               selector:@selector(fincambioDeNivelAccionEmparejar)
                                                               userInfo:nil
                                                                repeats:NO];
    
    
}

-(void)fincambioDeNivelAccionEmparejar
{
    if (self.tiempoImagenFinNivel) {
        [self.tiempoImagenFinNivel invalidate];
        self.tiempoImagenFinNivel = nil;
    }
    
    [self.tiempoTotalEmparejar invalidate];
    self.tiempoTotalEmparejar =nil;
    
    
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }
    
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    IntermediaJuegoViewController *intermediaViewController = [storyBoard instantiateViewControllerWithIdentifier:@"intermediaViewControllerID"];
    
    
    if ([self.nombreJuego isEqualToString:@"casa"]) {
        intermediaViewController.numJuego =1;
         self.juegoCasa.tiempoTotal =[NSNumber numberWithInt:([self.juegoCasa.tiempoTotal intValue]+ self.contadorTiempoTotalEmparejar)];
        
    }
    else if ([self.nombreJuego isEqualToString:@"cotidianas"]) {
        intermediaViewController.numJuego =2;
         self.juegoCotidianas.tiempoTotal =[NSNumber numberWithInt:([self.juegoCotidianas.tiempoTotal intValue]+ self.contadorTiempoTotalEmparejar)];
        
    }
    else if ([self.nombreJuego isEqualToString:@"modales"]) {
        intermediaViewController.numJuego =3;
         self.juegoModales.tiempoTotal =[NSNumber numberWithInt:([self.juegoModales.tiempoTotal intValue]+ self.contadorTiempoTotalEmparejar)];
        
    }
    else if ([self.nombreJuego isEqualToString:@"emociones"]) {
        intermediaViewController.numJuego =4;
         self.juegoEmociones.tiempoTotal =[NSNumber numberWithInt:([self.juegoEmociones.tiempoTotal intValue]+ self.contadorTiempoTotalEmparejar)];
        
    }
    
    [self.temporizadorEntreToquesEmparejar invalidate];
    self.temporizadorEntreToquesEmparejar=nil;
    
    intermediaViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    intermediaViewController.context = self.context;
    intermediaViewController.nombreNivel = @"Ordenar";
    
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }
    
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:intermediaViewController animated:YES];
    
}


-(void)cambiarImagenTonyEmparejar
{
    
    [self.view setUserInteractionEnabled:YES];
    [self.areaJuego setUserInteractionEnabled:YES];
    
    self.temporizadorEntreToquesEmparejar = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                                             target:self
                                                                           selector:@selector(tiempoExcedidoEntreToquesEmparejar)
                                                                           userInfo:nil
                                                                            repeats:NO];
    
    
    
    [self.temporizadorTony invalidate];
    self.temporizadorTony =nil;
    
    //imagen tony
    UIImage *imagTony = [UIImage imageNamed:@"tonyPregunta.png"];
    [self.imagenTony setImage:imagTony];
}


@end

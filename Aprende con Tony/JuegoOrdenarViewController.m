//
//  JuegoOrdenarViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 12/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "JuegoOrdenarViewController.h"

@interface JuegoOrdenarViewController ()

@end

@implementation JuegoOrdenarViewController

@synthesize juegoCasa, nombreJuego, nombreNivel, juegoCotidianas, juegoEmociones, juegoModales;
@synthesize context, usuarioSeleccionado, numDificultad;
@synthesize imagenTony, imagenRating, areaJuego, guionPictograma, ordenarObject, numImagenTocada, numAciertos,numFallos,bienArrastrada, accionCorrecta;
@synthesize imagenCorrectaDos, imagenCorrectaTres, imagenCorrectaUno, imagenPosDos, imagenPosTres, imagenPosUno;

@synthesize tiempoImagenFinNivelOrdenar, temporizadorEntreToquesOrdenar, temporizadorTonyOrdenar, temporizadorBordeRojoOrdenar, tiempoTotalOrdenar, contadorTiempoTotalOrdenar, soundBien, soundOrdena, soundAplausos;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self cargarBotonesNavigationOrdenar];
    
   ////// self.numImagenTocada = -1;
    self.numFallos =0;
    self.numAciertos=0;
    
    self.areaJuego.layer.borderColor = [UIColor yellowColor].CGColor;
    self.areaJuego.layer.borderWidth = 5.0f;
    self.areaJuego.layer.cornerRadius = 15;
    self.areaJuego.layer.masksToBounds = YES;
    
    
   
    NSLog(@"numDificultad = %d", self.juegoCasa.num_dificultad.intValue);
    NSLog(@"nombre user= %@", self.usuarioSeleccionado.nombre);
    
    self.contadorTiempoTotalOrdenar = 0;
    
    self.tiempoTotalOrdenar = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countupOrdenar) userInfo:nil repeats:YES];
    
    
    if([nombreJuego isEqualToString:@"cotidianas"])
    {
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoCotidianas.num_dificultad.intValue;
        
        
        switch (self.numDificultad) {
            case 1: //minima dificultad
                self.numAciertos = 2; //segun los aciertos ponemos mas o menos imagenes resueltas
                break;
            case 2: //media dificultad
                self.numAciertos = 1;
                break;
            case 3: //maxima dificultad
                self.numAciertos = 0;
                break;
                
            default:
                break;
        }
    }else if([nombreJuego isEqualToString:@"modales"])
    {
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoModales.num_dificultad.intValue;
        
        
        
        switch (self.numDificultad) {
            case 1: //minima dificultad
                self.numAciertos = 2; //segun los aciertos ponemos mas o menos imagenes resueltas
                break;
            case 2: //media dificultad
                self.numAciertos = 1;
                break;
            case 3: //maxima dificultad
                self.numAciertos = 0;
                break;
                
            default:
                break;
        }
    }else if([nombreJuego isEqualToString:@"emociones"])
    {
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoEmociones.num_dificultad.intValue;
        
        
        switch (self.numDificultad) {
            case 1: //minima dificultad
                self.numAciertos = 2; //segun los aciertos ponemos mas o menos imagenes resueltas
                break;
            case 2: //media dificultad
                self.numAciertos = 1;
                break;
            case 3: //maxima dificultad
                self.numAciertos = 0;
                break;
                
            default:
                break;
        }
    }else if([nombreJuego isEqualToString:@"casa"])
    {
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoCasa.num_dificultad.intValue;
        
        
        
        switch (self.numDificultad) {
            case 1: //minima dificultad
                self.numAciertos = 2; //segun los aciertos ponemos mas o menos imagenes resueltas
                break;
            case 2: //media dificultad
                self.numAciertos = 1;
                break;
            case 3: //maxima dificultad
                self.numAciertos = 0;
                break;
                
            default:
                break;
        }
    }
    
    
    
    /*Cargar sonidos*/
    NSString *soundOrdenaPath = [[NSBundle mainBundle] pathForResource:@"ordena"
                                                                ofType:@"aiff"];
    
    // If this file is actually in the bundle...
    if(soundOrdenaPath) {
        // Create a file URL with this path
        NSURL *soundOrdenaURL = [NSURL fileURLWithPath:soundOrdenaPath];
        
        // Register sound file located at that URL as a system sound
        OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundOrdenaURL, &soundOrdena);
        if(err != kAudioServicesNoError)
            NSLog(@"Could not load %@, error code: %d", soundOrdenaURL, (int)err);
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
    
    

    
    [self cargarVistaDelJuegoOrdenar];
}


-(void)viewWillDisappear:(BOOL)animated
{
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }
    
    
}

-(void)countupOrdenar
{
    //metodo para contabilizar el tiempo de juego
    self.contadorTiempoTotalOrdenar = self.contadorTiempoTotalOrdenar+1;
}


-(void)cargarVistaDelJuegoOrdenar
{
    self.temporizadorEntreToquesOrdenar = [NSTimer scheduledTimerWithTimeInterval:100.0
                                                                    target:self
                                                                  selector:@selector(tiempoExcedidoEntreToquesOrdenar)
                                                                  userInfo:nil
                                                                   repeats:NO];
    
    
    
    /** cargar datos segun el juego **/
    if ([nombreJuego isEqualToString:@"casa"]) {
        
        if (self.usuarioSeleccionado.usuario_juegoCasa.voz.intValue == 1) {
            // poner SONIDO
            AudioServicesPlaySystemSound(soundOrdena);

        }
        if (self.usuarioSeleccionado.usuario_juegoCasa.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoCasa.num_dificultad.intValue;
        switch (self.numDificultad) {
            case 1: //minima dificultad
                self.numAciertos = 2; //segun los aciertos ponemos mas o menos imagenes resueltas
                break;
            case 2: //media dificultad
                self.numAciertos = 1;
                break;
            case 3: //maxima dificultad
                self.numAciertos = 0;
                break;
                
            default:
                break;
        }
        
        
        
        switch (self.juegoCasa.num_nivel.intValue) {
            case 1:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelRopaOrdenar numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelTelefonoOrdenar numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelZumoOrdenar numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuegoOrdenar];
        
        
    }else if([nombreJuego isEqualToString:@"cotidianas"])
    {
        if (self.usuarioSeleccionado.usuario_juegoCotidianas.voz.intValue == 1) {
            // poner SONIDO
            AudioServicesPlaySystemSound(soundOrdena);

        }
        if (self.usuarioSeleccionado.usuario_juegoCotidianas.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoCotidianas.num_dificultad.intValue;
        
        
        switch (self.numDificultad) {
            case 1: //minima dificultad
                self.numAciertos = 2; //segun los aciertos ponemos mas o menos imagenes resueltas
                break;
            case 2: //media dificultad
                self.numAciertos = 1;
                break;
            case 3: //maxima dificultad
                self.numAciertos = 0;
                break;
                
            default:
                break;
        }
        
        switch (self.juegoCotidianas.num_nivel.intValue) {
            case 1:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelBarbaOrdenar numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelDientesOrdenar numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelDormirOrdenar numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuegoOrdenar];
        
    }else if([nombreJuego isEqualToString:@"modales"])
    {
        if (self.usuarioSeleccionado.usuario_juegoModales.voz.intValue == 1) {
            // poner SONIDO
            AudioServicesPlaySystemSound(soundOrdena);

        }
        if (self.usuarioSeleccionado.usuario_juegoModales.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoModales.num_dificultad.intValue;
        switch (self.numDificultad) {
            case 1: //minima dificultad
                self.numAciertos = 2; //segun los aciertos ponemos mas o menos imagenes resueltas
                break;
            case 2: //media dificultad
                self.numAciertos = 1;
                break;
            case 3: //maxima dificultad
                self.numAciertos = 0;
                break;
                
            default:
                break;
        }
        
        
        
        switch (self.juegoModales.num_nivel.intValue) {
            case 1:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelLavarManosOrdenar numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelMocosOrdenar numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelComerOrdenar numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuegoOrdenar];
        
    }else if([nombreJuego isEqualToString:@"emociones"])
    {
        if (self.usuarioSeleccionado.usuario_juegoEmociones.voz.intValue == 1) {
            // poner SONIDO
            AudioServicesPlaySystemSound(soundOrdena);

        }
        if (self.usuarioSeleccionado.usuario_juegoEmociones.guionPictos.intValue == 0) {
            // QUITAR GUION PICTOGRAMAS
            self.guionPictograma.hidden = YES;
        }
        
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
        self.numDificultad = self.juegoEmociones.num_dificultad.intValue;
        switch (self.numDificultad) {
            case 1: //minima dificultad
                self.numAciertos = 2; //segun los aciertos ponemos mas o menos imagenes resueltas
                break;
            case 2: //media dificultad
                self.numAciertos = 1;
                break;
            case 3: //maxima dificultad
                self.numAciertos = 0;
                break;
                
            default:
                break;
        }
        

        
        switch (self.juegoEmociones.num_nivel.intValue) {
            case 1:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelContentoOrdenar numero_dificultad:self.numDificultad];
                break;
            case 2:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelTristeOrdenar numero_dificultad:self.numDificultad];
                break;
            case 3:
                self.ordenarObject = [[OrdenarObject alloc]initWithInstruccion:NombreNivelAsustadoOrdenar numero_dificultad:self.numDificultad];
                break;
                
            default:
                break;
        }
        
        
        [self cargarImagenesJuegoOrdenar];
    }
    
    
    
}


#pragma mark metodos de control de toques


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    CGPoint locationAreaJuego = [touch locationInView:self.areaJuego];
    
    
    if(CGRectContainsPoint(self.imagenPosUno.frame, location)|| CGRectContainsPoint(self.imagenPosUno.frame, locationAreaJuego))
    {
        
        self.numImagenTocada = 1;
        
        
    }else if(CGRectContainsPoint(self.imagenPosDos.frame, location)|| CGRectContainsPoint(self.imagenPosDos.frame, locationAreaJuego))
    {
        
        self.numImagenTocada = 2;
    }else if(CGRectContainsPoint(self.imagenPosTres.frame, location)|| CGRectContainsPoint(self.imagenPosTres.frame, locationAreaJuego))
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
            self.imagenPosUno.transform = CGAffineTransformConcat(self.imagenPosUno.transform, translate);
        }
            break;
        case 2:
        {
            CGAffineTransform translate = CGAffineTransformMakeTranslation(xDif, yDif);
            self.imagenPosDos.transform = CGAffineTransformConcat(self.imagenPosDos.transform, translate);
        }
            break;
        case 3:
        {
            CGAffineTransform translate = CGAffineTransformMakeTranslation(xDif, yDif);
            self.imagenPosTres.transform = CGAffineTransformConcat(self.imagenPosTres.transform, translate);
        }
            break;
        default:
            break;
    }
    
    
    
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    
    NSString *imagenTocadaNombre = @"";
    

    
    switch (self.numDificultad) {
        case 3:
        {
            imagenTocadaNombre = [self.ordenarObject.arrayPosibilidades objectAtIndex:(self.numImagenTocada-1)];
            
            
        }
            break;
        case 2:
        {
            imagenTocadaNombre = [self.ordenarObject.arrayPosibilidades objectAtIndex:(self.numImagenTocada-2)];
           
        }
            break;
        case 1:
        {
            imagenTocadaNombre = [self.ordenarObject.arrayPosibilidades objectAtIndex:(self.numImagenTocada-2)];
           
        }
            break;
            
        default:
            break;
    }
    
    
   
    [self comprobarAccionOrdenar:imagenTocadaNombre];
    
    
    
    
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}


-(void)comprobarAccionOrdenar:(NSString *)imagenTocada
{
    //comprobamos que la imagen tocada es una de las opciones del array de opciones correctas.
    NSLog(@"comprobar accion: imagen tocada = %@       string correcta = %@", imagenTocada, [self.ordenarObject.arrayCorrectas objectAtIndex:self.numAciertos]);
    
    //**COMPROBAR BIEN ARRASTRADA O NO LA IMAGEN**//
    self.bienArrastrada = NO;
    self.accionCorrecta = NO;
    
    switch (self.numAciertos) {
        case 0: //toca colocar la primera imagen de la secuencia
        {
            if (CGRectContainsRect( [self.imagenCorrectaUno frame],[self.imagenPosUno frame] ))
            {
                self.bienArrastrada = YES;
            }else if (CGRectContainsRect ( [self.imagenCorrectaUno frame], [self.imagenPosDos frame] ))
            {
                self.bienArrastrada = YES;
            }else if (CGRectContainsRect ( [self.imagenCorrectaUno frame], [self.imagenPosTres frame] ))
            {
                self.bienArrastrada = YES;
            }
            
        }
            break;
        case 1: //toca colocar la segunda imagen de la secuencia
        {
            if (CGRectContainsRect( [self.imagenCorrectaDos frame],[self.imagenPosUno frame] ))
            {
                self.bienArrastrada = YES;
            }else if (CGRectContainsRect ( [self.imagenCorrectaDos frame], [self.imagenPosDos frame] ))
            {
                self.bienArrastrada = YES;
            }else if (CGRectContainsRect ( [self.imagenCorrectaDos frame], [self.imagenPosTres frame] ))
            {
                self.bienArrastrada = YES;
            }
        }
            break;
        case 2: //toca colocar la ultima imagen de la secuencia
        {
            if (CGRectContainsRect( [self.imagenCorrectaTres frame],[self.imagenPosUno frame] ))
            {
                self.bienArrastrada = YES;
            }else if (CGRectContainsRect ( [self.imagenCorrectaTres frame], [self.imagenPosDos frame] ))
            {
                self.bienArrastrada = YES;
            }else if (CGRectContainsRect ( [self.imagenCorrectaTres frame], [self.imagenPosTres frame] ))
            {
                self.bienArrastrada = YES;
            }
        }
            break;
        default:
            break;
    }
    
    NSLog(@"------>> %@   ---->>  %@", [self.ordenarObject.arrayCorrectas objectAtIndex:self.numAciertos], imagenTocada);
  
    if ([[self.ordenarObject.arrayCorrectas objectAtIndex:self.numAciertos] isEqualToString: imagenTocada])
    {
        
        /** accion correcta **/
        NSLog(@"ACCION CORRECTA......");
        self.accionCorrecta = YES;
        
    }
    //**COMPROBAR IMAGEN TOCADA**//
    if (self.accionCorrecta && self.bienArrastrada)
    {
        
        [self.temporizadorEntreToquesOrdenar invalidate];
        self.temporizadorEntreToquesOrdenar=nil;
        
        //imagen tony
        UIImage *imagTony = [UIImage imageNamed:@"tonyContento.png"];
        [self.imagenTony setImage:imagTony];
        
        
        [self.view setUserInteractionEnabled:NO];
        [self.areaJuego setUserInteractionEnabled:NO];
        self.temporizadorTonyOrdenar = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                                 target:self
                                                               selector:@selector(cambiarImagenTonyOrdenar)
                                                               userInfo:nil
                                                                repeats:NO];
        
        
        //**poner borde verde**/
        self.temporizadorBordeRojoOrdenar = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                                      target:self
                                                                    selector:@selector(quitarBordeOrdenar)
                                                                    userInfo:nil
                                                                     repeats:NO];
        
        
        switch (self.numImagenTocada) {
            case 1:
            {
                self.imagenPosUno.layer.borderColor = [UIColor greenColor].CGColor;
                self.imagenPosUno.layer.borderWidth = 5.0f;
                self.imagenPosUno.layer.cornerRadius = 15;
                self.imagenPosUno.layer.masksToBounds = YES;
                
            }
                break;
            case 2:
            {
                
                self.imagenPosDos.layer.borderColor = [UIColor greenColor].CGColor;
                self.imagenPosDos.layer.borderWidth = 5.0f;
                self.imagenPosDos.layer.cornerRadius = 15;
                self.imagenPosDos.layer.masksToBounds = YES;
                
            }
                break;
            case 3:
            {
                
                self.imagenPosTres.layer.borderColor = [UIColor greenColor].CGColor;
                self.imagenPosTres.layer.borderWidth = 5.0f;
                self.imagenPosTres.layer.cornerRadius = 15;
                self.imagenPosTres.layer.masksToBounds = YES;
                
            }
                break;
                
            default:
                break;
        }
        
        
        //****/
        
        self.numAciertos++;
        AudioServicesPlaySystemSound(soundBien);

        
        //imagen rating
        switch (self.numAciertos) {
            case 1:
            {
                UIImage *imagRating = [UIImage imageNamed:@"ratinguno.png"];
                [self.imagenRating setImage:imagRating];
            }
                break;
            case 2:
            {
                UIImage *imagRating = [UIImage imageNamed:@"ratingdos.png"];
                [self.imagenRating setImage:imagRating];
            }
                break;
            case 3:
            {
                UIImage *imagRating = [UIImage imageNamed:@"ratingtres.png"];
                [self.imagenRating setImage:imagRating];
            }
                break;
                
            default:
                break;
        }
       
        
        
        if (self.numAciertos == 3) {
            //ha finalizado el nivel REALIZAR UNA DETERMINADA ACCION: cambio de nivel o juego
            
            
            //guardamos datos
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            
            /**  cambio de nivel el usuario lo ha superado correctamente**/
            self.tiempoImagenFinNivelOrdenar = [NSTimer scheduledTimerWithTimeInterval:4.0
                                                                         target:self
                                                                       selector:@selector(cambioDeNivelAccionOrdenar)
                                                                       userInfo:nil
                                                                        repeats:NO];
        }
        
        
        
    }else
    {
        /** accion incorrecta **/
        self.numFallos++;
        
        
        [self.view setUserInteractionEnabled:NO];
        [self.areaJuego setUserInteractionEnabled:NO];
        self.temporizadorBordeRojoOrdenar = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                                      target:self
                                                                    selector:@selector(quitarBordeOrdenar)
                                                                    userInfo:nil
                                                                     repeats:NO];
        
        switch (self.numImagenTocada) {
            case 1:
            {
                if (!self.accionCorrecta)
                {
                    self.imagenPosUno.layer.borderColor = [UIColor redColor].CGColor;
                    self.imagenPosUno.layer.borderWidth = 5.0f;
                    self.imagenPosUno.layer.cornerRadius = 15;
                    self.imagenPosUno.layer.masksToBounds = YES;
                }
                
                /////////// Animacion volver imagen al inicio
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
                [UIView setAnimationBeginsFromCurrentState:YES];
                [UIView setAnimationDuration:1.0];
                self.imagenPosUno.transform = CGAffineTransformIdentity;
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
                    self.imagenPosDos.layer.borderColor = [UIColor redColor].CGColor;
                    self.imagenPosDos.layer.borderWidth = 5.0f;
                    self.imagenPosDos.layer.cornerRadius = 15;
                    self.imagenPosDos.layer.masksToBounds = YES;
                }
                
                /////////// Animacion volver imagen al inicio
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
                [UIView setAnimationBeginsFromCurrentState:YES];
                [UIView setAnimationDuration:1.0];
                self.imagenPosDos.transform = CGAffineTransformIdentity;
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
                    self.imagenPosTres.layer.borderColor = [UIColor redColor].CGColor;
                    self.imagenPosTres.layer.borderWidth = 5.0f;
                    self.imagenPosTres.layer.cornerRadius = 15;
                    self.imagenPosTres.layer.masksToBounds = YES;
                }
                
                /////////// Animacion volver imagen al inicio
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
                [UIView setAnimationBeginsFromCurrentState:YES];
                [UIView setAnimationDuration:1.0];
                self.imagenPosTres.transform = CGAffineTransformIdentity;
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
            
            
            
            [self.temporizadorEntreToquesOrdenar invalidate];
            self.temporizadorEntreToquesOrdenar=nil;
            
            
            
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
            
            
            [self cargarVistaDelJuegoOrdenar];
            
            
            
        }
        
        //REALIZAR ACCION CORRESPONDIENTE
        NSError *error;
        if (![self.context save:&error]) {
            NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
            exit(-1);
        }
        
        
        
    }
    
    
}



#pragma mark cambio de nivel metodos

-(void)cambioDeNivelAccionOrdenar
{
    
    [self.tiempoImagenFinNivelOrdenar invalidate];
    self.tiempoImagenFinNivelOrdenar=nil;
    
    UIImageView *brickAnim = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"finNivelBien.png"]];
    brickAnim.frame = self.view.frame;
    [self.view addSubview:brickAnim];
    
    
    AudioServicesPlaySystemSound(soundAplausos);
    
    [self.tiempoImagenFinNivelOrdenar invalidate];
    self.tiempoImagenFinNivelOrdenar = nil;
    self.tiempoImagenFinNivelOrdenar = [NSTimer scheduledTimerWithTimeInterval:7.0
                                                                 target:self
                                                               selector:@selector(fincambioDeNivelAccionOrdenar)
                                                               userInfo:nil
                                                                repeats:NO];
    
    
}

-(void)fincambioDeNivelAccionOrdenar
{
    if (self.tiempoImagenFinNivelOrdenar) {
        [self.tiempoImagenFinNivelOrdenar invalidate];
        self.tiempoImagenFinNivelOrdenar = nil;
    }
    
    [self.tiempoTotalOrdenar invalidate];
    self.tiempoTotalOrdenar =nil;
    
    
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
        
        if ([self.juegoCasa.num_nivel intValue] <= 3) {
            self.juegoCasa.num_nivel = [NSNumber numberWithInt:[self.juegoCasa.num_nivel intValue] +1];
             self.juegoCasa.tiempoTotal =[NSNumber numberWithInt:([self.juegoCasa.tiempoTotal intValue]+ self.contadorTiempoTotalOrdenar)];
            
            NSLog(@"self.numnivel = %d", self.juegoCasa.num_nivel.intValue);
        }

    }
    else if ([self.nombreJuego isEqualToString:@"cotidianas"]) {
        intermediaViewController.numJuego =2;
        
        if ([self.juegoCotidianas.num_nivel intValue] <= 3) {
            self.juegoCotidianas.num_nivel = [NSNumber numberWithInt:[self.juegoCotidianas.num_nivel intValue] +1];
             self.juegoCotidianas.tiempoTotal =[NSNumber numberWithInt:([self.juegoCotidianas.tiempoTotal intValue]+ self.contadorTiempoTotalOrdenar)];
          
            NSLog(@"self.numnivel = %d", self.juegoCotidianas.num_nivel.intValue);
        }
        
    }
    else if ([self.nombreJuego isEqualToString:@"modales"]) {
        intermediaViewController.numJuego =3;
        
        if ([self.juegoModales.num_nivel intValue] <= 3) {
            self.juegoModales.num_nivel = [NSNumber numberWithInt:[self.juegoModales.num_nivel intValue] +1];
             self.juegoModales.tiempoTotal =[NSNumber numberWithInt:([self.juegoModales.tiempoTotal intValue]+ self.contadorTiempoTotalOrdenar)];
            
            NSLog(@"self.numnivel = %d", self.juegoModales.num_nivel.intValue);
        }
    }
    else if ([self.nombreJuego isEqualToString:@"emociones"]) {
        intermediaViewController.numJuego =4;
        if ([self.juegoEmociones.num_nivel intValue] <= 3) {
            self.juegoEmociones.num_nivel = [NSNumber numberWithInt:[self.juegoEmociones.num_nivel intValue] +1];
             self.juegoEmociones.tiempoTotal =[NSNumber numberWithInt:([self.juegoEmociones.tiempoTotal intValue]+ self.contadorTiempoTotalOrdenar)];
            
            NSLog(@"self.numnivel = %d", self.juegoEmociones.num_nivel.intValue);
        }
        
    }
    
    [self.temporizadorEntreToquesOrdenar invalidate];
    self.temporizadorEntreToquesOrdenar=nil;
    
    intermediaViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    intermediaViewController.context = self.context;
    
    
    
    NSError *error2;
    if (![self.context save:&error2]) {
        NSLog(@"Error de Core Data %@, %@", error2, [error2 userInfo]);
        exit(-1);
    }
    
    
    if ([self.nombreJuego isEqualToString:@"casa"]) {
        
        if ([self.juegoCasa.num_nivel intValue] <= 3) {
          
            NSLog(@"self.numnivel = %d", self.juegoCasa.num_nivel.intValue);
            intermediaViewController.nombreNivel = @"Seleccionar";
            
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:intermediaViewController animated:YES];
        }else
        {
            
           // self.juegoCasa.tiempoTotal =[NSNumber numberWithInt:0];
            self.juegoCasa.num_nivel = [NSNumber numberWithInt:1];
            
            self.juegoCasa.superado = @"SI";
            [self.juegoCasa setSuperado:@"SI"];
            
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            

            
            //fin del juego volvemos al dash
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            DashBoardViewController *dashboardViewController = [storyBoard instantiateViewControllerWithIdentifier:@"dashBoardViewControllerID"];
            dashboardViewController.context = self.context;
            dashboardViewController.usuarioSeleccionado = self.usuarioSeleccionado;
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:dashboardViewController animated:YES];
        }
        
    }
    else if ([self.nombreJuego isEqualToString:@"cotidianas"]) {
        if ([self.juegoCotidianas.num_nivel intValue] <= 3) {
            
            NSLog(@"self.numnivel = %d", self.juegoCotidianas.num_nivel.intValue);
            intermediaViewController.nombreNivel = @"Seleccionar";
            
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:intermediaViewController animated:YES];
        }else
        {
            
            //self.juegoCotidianas.tiempoTotal =[NSNumber numberWithInt:0];
            self.juegoCotidianas.num_nivel = [NSNumber numberWithInt:1];
            
            self.juegoCotidianas.superado = @"SI";
            [self.juegoCotidianas setSuperado:@"SI"];
            
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            //fin del juego volvemos al dash
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            DashBoardViewController *dashboardViewController = [storyBoard instantiateViewControllerWithIdentifier:@"dashBoardViewControllerID"];
            dashboardViewController.context = self.context;
            dashboardViewController.usuarioSeleccionado = self.usuarioSeleccionado;
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:dashboardViewController animated:YES];
        }
        
    }
    else if ([self.nombreJuego isEqualToString:@"modales"]) {
        if ([self.juegoModales.num_nivel intValue] <= 3) {
            
            NSLog(@"self.numnivel = %d", self.juegoModales.num_nivel.intValue);
            intermediaViewController.nombreNivel = @"Seleccionar";
            
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:intermediaViewController animated:YES];
        }else
        {
            //self.juegoModales.tiempoTotal =[NSNumber numberWithInt:0];
            self.juegoModales.num_nivel = [NSNumber numberWithInt:1];
            
            self.juegoModales.superado = @"SI";
            [self.juegoModales setSuperado:@"SI"];
            
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            //fin del juego volvemos al dash
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            DashBoardViewController *dashboardViewController = [storyBoard instantiateViewControllerWithIdentifier:@"dashBoardViewControllerID"];
            dashboardViewController.context = self.context;
            dashboardViewController.usuarioSeleccionado = self.usuarioSeleccionado;
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:dashboardViewController animated:YES];
        }
        
    }
    else if ([self.nombreJuego isEqualToString:@"emociones"]) {
        if ([self.juegoEmociones.num_nivel intValue] <= 3) {
            
            NSLog(@"self.numnivel = %d", self.juegoEmociones.num_nivel.intValue);
            intermediaViewController.nombreNivel = @"Seleccionar";
            
            
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:intermediaViewController animated:YES];
        }else
        {
            
            //self.juegoEmociones.tiempoTotal =[NSNumber numberWithInt:0];
            self.juegoEmociones.num_nivel = [NSNumber numberWithInt:1];
            
            self.juegoEmociones.superado = @"SI";
            [self.juegoEmociones setSuperado:@"SI"];
            
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            //fin del juego volvemos al dash
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            DashBoardViewController *dashboardViewController = [storyBoard instantiateViewControllerWithIdentifier:@"dashBoardViewControllerID"];
            dashboardViewController.context = self.context;
            dashboardViewController.usuarioSeleccionado = self.usuarioSeleccionado;
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:dashboardViewController animated:YES];
        }
        
    }
    

    
    
    
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }
    
    
   
    
}

#pragma mark metodos shake imagenes
-(void)shakeViewOrdenar:(UIImageView *)imagen {
    
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

-(void)tiempoExcedidoEntreToquesOrdenar{
    
    [self.temporizadorBordeRojoOrdenar invalidate];
    self.temporizadorBordeRojoOrdenar =nil;
    
    
    self.numFallos++;
    
    
    
    if (self.numFallos<5) {
        
        NSLog(@"tiempo entre toques excedido seleccionar view controller...");
        self.temporizadorEntreToquesOrdenar = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                                        target:self
                                                                      selector:@selector(tiempoExcedidoEntreToquesOrdenar)
                                                                      userInfo:nil
                                                                       repeats:NO];
        
        //movemos imagenes a tocar correctas
        
        if (self.numAciertos == 0) {
            [self shakeViewOrdenar:self.imagenPosUno];
            [self shakeViewOrdenar:self.imagenPosDos];
            [self shakeViewOrdenar:self.imagenPosTres];
            
        }
        if (self.numAciertos == 1) {
            [self shakeViewOrdenar:self.imagenPosTres];
            [self shakeViewOrdenar:self.imagenPosDos];
        }
        if (self.numAciertos == 2) {
            [self shakeViewOrdenar:self.imagenPosDos];
        }
        
        
        
        
        
    }else if(self.numFallos==5)
    {
        [self.temporizadorBordeRojoOrdenar invalidate];
        self.temporizadorBordeRojoOrdenar =nil;
        NSLog(@"tiempo entre toques excedido y maximo numero de fallos cumplido");
        
        if (numFallos == 5) { //Se permiten 5 fallos antes de cambiar de dificultad automaticamente
            
            if (self.numDificultad>1) {
                self.numDificultad--;
                
            }
            
            [self.temporizadorEntreToquesOrdenar invalidate];
            self.temporizadorEntreToquesOrdenar=nil;
            
            
            
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
                [self cargarVistaDelJuegoOrdenar];
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

-(void)quitarBordeOrdenar
{
    
    
    
    switch (self.numImagenTocada) {
        case 1:
            self.imagenPosUno.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenPosUno.layer.masksToBounds = YES;
            break;
        case 2:
            
            self.imagenPosDos.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenPosDos.layer.masksToBounds = YES;
            break;
        case 3:
            
            self.imagenPosTres.layer.borderColor = [UIColor clearColor].CGColor;
            self.imagenPosTres.layer.masksToBounds = YES;
            break;
       
        default:
            break;
    }
    
    [self.view setUserInteractionEnabled:YES];
    [self.areaJuego setUserInteractionEnabled:YES];
    
    [self.temporizadorBordeRojoOrdenar invalidate];
    self.temporizadorBordeRojoOrdenar =nil;
    
}

-(void)cambiarImagenTonyOrdenar
{
    
    self.temporizadorEntreToquesOrdenar = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                                    target:self
                                                                  selector:@selector(tiempoExcedidoEntreToquesOrdenar)
                                                                  userInfo:nil
                                                                   repeats:NO];
    
    
    [self.view setUserInteractionEnabled:YES];
    [self.areaJuego setUserInteractionEnabled:YES];
    
    [self.temporizadorTonyOrdenar invalidate];
    self.temporizadorTonyOrdenar =nil;
    
    //imagen tony
    UIImage *imagTony = [UIImage imageNamed:@"tonyPregunta.png"];
    [self.imagenTony setImage:imagTony];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark metodos de carga de pantalla

-(void)cargarBotonesNavigationOrdenar
{
    /** FIJAR BOTON GAMES EN BARRA DE NAVEGACIÓN **/
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"games.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goToDashViewControllerOrdenar:)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButton;
    
    /** FIJAR BOTON HOME EN BARRA DE NAVEGACIÓN **/
    UIButton *buttonHome =  [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonHome setImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [buttonHome addTarget:self action:@selector(goToSeleccionarUsuariosViewControllerOrdenar:)forControlEvents:UIControlEventTouchUpInside];
    [buttonHome setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButtonH = [[UIBarButtonItem alloc] initWithCustomView:buttonHome];
    self.navigationItem.leftBarButtonItem = barButtonH;
}

-(void)cargarImagenesJuegoOrdenar
{
    
    if (self.numDificultad == 3) {
        //imagen posibilidad uno
        NSString *imagen_uno = [self.ordenarObject.arrayPosibilidades objectAtIndex:0];
        UIImage *imagenuno = [UIImage imageNamed:imagen_uno];
        [self.imagenPosUno setImage:imagenuno];
        
        //imagen posibilidad dos
        NSString *imagen_dos=[self.ordenarObject.arrayPosibilidades objectAtIndex:1];
        UIImage *imagendos = [UIImage imageNamed:imagen_dos];
        [self.imagenPosDos setImage:imagendos];
        
        //imagen posibilidad tres
        NSString *imagen_tres=[self.ordenarObject.arrayPosibilidades objectAtIndex:2];
        UIImage *imagentres = [UIImage imageNamed:imagen_tres];
        [self.imagenPosTres setImage:imagentres];
    }else if(self.numDificultad == 2)
    {
        
        //imagen posibilidad dos
        NSString *imagen_dos=[self.ordenarObject.arrayPosibilidades objectAtIndex:0];
        UIImage *imagendos = [UIImage imageNamed:imagen_dos];
        [self.imagenPosDos setImage:imagendos];
        
        //imagen posibilidad tres
        NSString *imagen_tres=[self.ordenarObject.arrayPosibilidades objectAtIndex:1];
        UIImage *imagentres = [UIImage imageNamed:imagen_tres];
        [self.imagenPosTres setImage:imagentres];
        
        if (!self.imagenPosUno.hidden) {
            self.imagenPosUno.hidden = YES;
        }
        
        
        
    }else if (self.numDificultad ==1) //dificultad menor
    {
        
        //imagen posibilidad dos
        NSString *imagen_dos=[self.ordenarObject.arrayPosibilidades objectAtIndex:0];
        UIImage *imagendos = [UIImage imageNamed:imagen_dos];
        [self.imagenPosDos setImage:imagendos];
        
        
        if (!self.imagenPosUno.hidden) {
            self.imagenPosUno.hidden = YES;
        }
        if (!self.imagenPosTres.hidden) {
            self.imagenPosTres.hidden = YES;
        }
        
        
    }
    
    switch (self.numAciertos) {
      
        case 1:
        {
            NSString *imagen_tres=[self.ordenarObject.arrayCorrectas objectAtIndex:0];
            UIImage *imagentres = [UIImage imageNamed:imagen_tres];
            [self.imagenCorrectaUno setImage:imagentres];
        }
            break;
        case 2:
        {
            NSString *imagen_dos=[self.ordenarObject.arrayCorrectas objectAtIndex:0];
            UIImage *imagenDos = [UIImage imageNamed:imagen_dos];
            [self.imagenCorrectaUno setImage:imagenDos];
            
            NSString *imagen_tres=[self.ordenarObject.arrayCorrectas objectAtIndex:1];
            UIImage *imagentres = [UIImage imageNamed:imagen_tres];
            [self.imagenCorrectaDos setImage:imagentres];
        }
            break;
        default:
            break;
    }
    
    
    
}

#pragma mark metodos botones navigation bar

-(void)goToDashViewControllerOrdenar:(id)sender
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

-(void)goToSeleccionarUsuariosViewControllerOrdenar:(id)sender
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
        DashBoardViewController *dashboardViewController = [storyBoard instantiateViewControllerWithIdentifier:@"dashBoardViewControllerID"];
        dashboardViewController.context = self.context;
        dashboardViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:dashboardViewController animated:YES];
        
    }
    
    
    
}


@end
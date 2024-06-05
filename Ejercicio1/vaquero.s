.ifndef vaquero_s
.equ vaquero_s, 0
.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480

vaquero:
stur lr, [sp]
sub sp,sp,8
	
poncho:
	mov x11,SCREEN_WIDTH
	movz x10, 0x80, lsl 16
	movk x10, 0x2D08, lsl 00

	mov x12, 80 // modifica el ejey del poncho (en tamaño)
	mov x4, 290 // modifica el ejey del poncho (en posicion)

base_poncho:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 120 // Distribuye en el eje x el poncho
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,80 //Anchen
loop19: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop19
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_poncho

brazo:
	mov x0, x20

	mov x2,26       //Alto del circulo 
	mov x15,200     //es la coordenada x del cuadrado 
	mov x3,300      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	mov x16,x15
	movz x10,0x9b,lsl 16  //Color que quiero pintar el brazo
	movk x10,0x5D09, lsl 00
reset_brazo:
	mov x15,x16
	add x3,x3,1
	add x4,x4,1
	mov x1,26 // Ancho del circulo 

loop_brazo:
	
	cmp x15,x4             //1600 =r² 
	b.gt loop2_brazo             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_brazo:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_brazo	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_brazo         // if not last row, jump

brazo2:
	mov x0, x20

	mov x2,20       //Alto del circulo 
	mov x15,199     //es la coordenada x del cuadrado 
	mov x3,323      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	mov x16,x15
	movz x10,0x9B,lsl 16  //Color que quiero pintar el brazo
	movk x10,0x5D09, lsl 00
reset_brazo2:
	mov x15,x16
	add x3,x3,1
	add x4,x4,1
	mov x1,26 // Ancho del circulo 

loop_brazo2:
	
	cmp x4,x15             //1600 =r² 
	b.gt loop2_brazo2             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_brazo2:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_brazo2	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_brazo2         // if not last row, jump

brazo3:
	mov x11,SCREEN_WIDTH
	movz x10, 0x9B, lsl 16
	movk x10, 0x5D09, lsl 00

	mov x12, 19 // modifica el ejey del brazo (en tamaño)
	mov x4, 326 // modifica el ejey del brazo (en posicion)

base_brazo3:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 220 // Distribuye en el eje x el brazo
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,25 //Anchen
loop_brazo3: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_brazo3
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_brazo3

manga:
	mov x11,SCREEN_WIDTH
	movz x10, 0x80, lsl 16
	movk x10, 0x2D08, lsl 00

	mov x12, 22 // modifica el ejey de la manga (en tamaño)
	mov x4, 325 // modifica el ejey de la manga (en posicion)

base_manga:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 240 // Distribuye en el eje x la manga
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,10 //Anchen
loop_manga: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_manga
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_manga

chumbo:
	mov x11,SCREEN_WIDTH
	movz x10, 0x66, lsl 16
	movk x10, 0x6666, lsl 00

	mov x12, 19 // modifica el ejey del fierro (en tamaño)
	mov x4, 320 // modifica el ejey del fierro (en posicion)

base_chumbo:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 255 // Distribuye en el eje x el chumbo segun uno de los integrantes, el fierro segun otro. 
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,8 //Anchen
loop_chumbo: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_chumbo
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_chumbo

chumbo2:
	mov x0, x20
	mov x2,8       //Alto del circulo 
	mov x15,255    //es la coordenada x del cuadrado 
	mov x3,312	      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	mov x16,x15
	add x4,x4,x2
	movz x10,0x66,lsl 16  //Color que quiero pintar el arma
	movk x10,0x6666, lsl 00
reset_chumbo2:
	mov x15,x16
	add x3,x3,1
	sub x4,x4,1
	mov x1,8 // Ancho del circulo 
loop_chumbo2:
	
	cmp x4,x15             //1600 =r² 
	b.gt loop2_chumbo2             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_chumbo2:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_chumbo2	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_chumbo2        // if not last row, jump

chumbo3:
	mov x11,SCREEN_WIDTH
	movz x10, 0x66, lsl 16
	movk x10, 0x6666, lsl 00

	mov x12, 10 // modifica el ejey del chumbo (en tamaño)
	mov x4, 313 // modifica el ejey del chumbo (en posicion)

base_chumbo3:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 262 // Distribuye en el eje x al chumbo
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,20 //Anchen
loop_chumbo3: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_chumbo3
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_chumbo3


chumbo4:
	mov x11,SCREEN_WIDTH
	movz x10, 0x44, lsl 16
	movk x10, 0x4444, lsl 00

	mov x12, 14 // modifica el ejey del chumbo (en tamaño)
	mov x4, 311 // modifica el ejey del chumbo (en posicion)

base_chumbo4:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 264 // Distribuye en el eje x al chumbo
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,10 //Anchen
loop_chumbo4: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_chumbo4
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_chumbo4

chumbo5:
	mov x11,SCREEN_WIDTH
	movz x10, 0x66, lsl 16
	movk x10, 0x6666, lsl 00

	mov x12, 5 // modifica el ejey del chumbo (en tamaño)
	mov x4, 313 // modifica el ejey del chumbo (en posicion)

base_chumbo5:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 275 // Distribuye en el eje x al chumbo
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,20 //Anchen
loop_chumbo5: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_chumbo5
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_chumbo5

chumbo6:
	mov x11,SCREEN_WIDTH
	movz x10, 0x66, lsl 16
	movk x10, 0x6666, lsl 00

	mov x12, 5 // modifica el ejey del chumbo (en tamaño)
	mov x4, 313 // modifica el ejey del chumbo (en posicion)

base_chumbo6:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 255 // Distribuye en el eje x al chumbo
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,5 //Anchen
loop_chumbo6: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_chumbo6
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_chumbo6

mano:
	mov x0, x20
	mov x2,17       //Alto del circulo 
	mov x15,250    //es la coordenada x del cuadrado 
	mov x3,326	      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	mov x16,x15
	add x4,x4,x2
	movz x10,0xA1,lsl 16  //Color que quiero pintar la mano
	movk x10,0x7D61, lsl 00
reset_mano:
	mov x15,x16
	add x3,x3,1
	sub x4,x4,1
	mov x1,20 // Ancho del circulo 
loop_mano:
	
	cmp x15,x4             //1600 =r² 
	b.gt loop2_mano             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_mano:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_mano	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_mano        // if not last row, jump


hombro1:
	mov x0, x20

	mov x2,20       //Alto del circulo 
	mov x15,190     //es la coordenada x del cuadrado 
	mov x3,290      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,10
	add x6,x3,10
	mov x16,x15

	movz x10,0x80,lsl 16  //Color que quiero pintar el hombro circular
	movk x10,0x2D08, lsl 00 
reset_hombro:
	mov x15,x16
	add x3,x3,1
	mov x1,20 // Ancho del circulo 
loop_hombro:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,100             //1600 =r² 
	b.gt loop2_hombro             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_hombro:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_hombro	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_hombro         // if not last row, jump

hombro2:
	mov x0, x20

	mov x2,20       //Alto del circulo 
	mov x15,113     //es la coordenada x del cuadrado 
	mov x3,288      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	add x7,x15,10
	add x6,x3,10
	mov x16,x15

	movz x10,0x80,lsl 16  //Color que quiero pintar el hombro circular
	movk x10,0x2D08, lsl 00 
reset_hombro2:
	mov x15,x16
	add x3,x3,1
	mov x1,20 // Ancho del circulo 
loop_hombro2:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,100             //1600 =r² 
	b.gt loop2_hombro2             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_hombro2:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_hombro2	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_hombro2         // if not last row, jump

remera:
	mov x0, x20

	mov x2,76       //Alto del circulo 
	mov x15,139     //es la coordenada x del cuadrado 
	mov x3,300      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	add x4,x4,x2
	movz x10,0x9b,lsl 16  //Color que quiero pintar parcialmente la remera
	movk x10,0x5D09, lsl 00
reset_remera:
	mov x15,120
	add x3,x3,1
	sub x4,x4,1
	mov x1,81 // Ancho del circulo 

loop_remera:
	
	cmp x4,x15             //1600 =r² 
	b.gt loop2_remera             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_remera:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_remera	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_remera         // if not last row, jump

pantalon1:
	mov x11,SCREEN_WIDTH
	movz x10, 0x0A, lsl 16
	movk x10, 0x1754, lsl 00

	mov x12, 24 // modifica el ejey del lompa (en tamaño)
	mov x4, 380 // modifica el ejey del lompa (en posicion)

base_pantalon:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 122 // Distribuye en el eje x el lompa
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,79 //Anchen
looppantalon: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, looppantalon
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_pantalon

pantalon2:
	mov x11,SCREEN_WIDTH
	movz x10, 0x0A, lsl 16
	movk x10, 0x1754, lsl 00

	mov x12, 40 // modifica el ejey del lompa (en tamaño)
	mov x4, 393 // modifica el ejey del lompa (en posicion)

base_pantalon2:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 118 // Distribuye en el eje x el lompa
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,35 //Anchen
looppantalon2: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, looppantalon2
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_pantalon2

pantalon3:
	mov x11,SCREEN_WIDTH
	movz x10, 0x0A, lsl 16
	movk x10, 0x1754, lsl 00

	mov x12, 40 // modifica el ejey del lompa (en tamaño)
	mov x4, 393 // modifica el ejey del lompa (en posicion)

base_pantalon3:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 170 // Distribuye en el eje x el lompa
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,35 //Anchen
looppantalon3: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, looppantalon3
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_pantalon3

bota1:
	mov x11,SCREEN_WIDTH
	movz x10, 0x31, lsl 16
	movk x10, 0x0E03, lsl 00

	mov x12, 8 // modifica el ejey de la bota (en tamaño)
	mov x4, 433 // modifica el ejey de la bota (en posicion)

base_bota1:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 175 // Distribuye en el eje x la bota
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,25 //Anchen
loop_bota1: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_bota1
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_bota1

bota2:
	mov x11,SCREEN_WIDTH
	movz x10, 0x31, lsl 16
	movk x10, 0x0E03, lsl 00

	mov x12, 8 // modifica el ejey de la bota (en tamaño)
	mov x4, 433 // modifica el ejey de la bota (en posicion)

base_bota2:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 123 // Distribuye en el eje x la bota
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,25 //Anchen
loop_bota2: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_bota2
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_bota2

bota3:
	mov x11,SCREEN_WIDTH
	movz x10, 0x31, lsl 16
	movk x10, 0x0E03, lsl 00

	mov x12, 13 // modifica el ejey de la bota (en tamaño)
	mov x4, 440 // modifica el ejey de la bota (en posicion)

base_bota3:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 113 // Distribuye en el eje x la bota
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,37 //Anchen
loop_bota3: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_bota3
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_bota3

bota4:
	mov x11,SCREEN_WIDTH
	movz x10, 0x31, lsl 16
	movk x10, 0x0E03, lsl 00

	mov x12, 13 // modifica el ejey de la bota (en tamaño)
	mov x4, 440 // modifica el ejey de la bota (en posicion)

base_bota4:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 172 // Distribuye en el eje x la bota
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,37 //Anchen
loop_bota4: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_bota4
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_bota4


cinturon:
	mov x11,SCREEN_WIDTH
	movz x10, 0x31, lsl 16
	movk x10, 0x0E03, lsl 00

	mov x12, 14 // modifica el ejey del cinto (en tamaño)
	mov x4, 370 // modifica el ejey del cinto (en posicion)

base_cinturon:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 120 // Distribuye en el eje x el cinto
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,83 //Anchen
loopcinturon: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loopcinturon
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_cinturon

poncho2:
	mov x0, x20

	mov x2,35       //Alto del circulo 
	mov x15,90     //es la coordenada x del cuadrado 
	mov x3,288      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	mov x16,x15
	add x4,x4,x2
	movz x10,0x80,lsl 16  //Color que quiero pintar el fragmento de ponco
	movk x10,0x2D08, lsl 00
reset_poncho2:
	mov x15,x16
	add x3,x3,1
	sub x4,x4,1
	mov x1,35 // Ancho del circulo 

loop_poncho2:
	
	cmp x4,x15             //1600 =r² 
	b.gt loop2_poncho2             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_poncho2:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_poncho2	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_poncho2         // if not last row, jump

poncho3:
	mov x0, x20

	mov x2,45       //Alto del circulo 
	mov x15,85     //es la coordenada x del cuadrado 
	mov x3,360      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	mov x16,x15
	add x4,x4,x2
	movz x10,0x80,lsl 16  //Color que quiero pintar el 3er fragmento de poncho
	movk x10,0x2D08, lsl 00
reset_poncho3:
	mov x15,x16
	add x3,x3,1
	sub x4,x4,1
	mov x1,45 // Ancho del circulo 


loop_poncho3:
	
	cmp x15,x4             //1600 =r² 
	b.gt loop2_poncho3             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_poncho3:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_poncho3	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_poncho3         // if not last row, jump

poncho4:
	mov x0, x20

	mov x2,45       //Alto del circulo 
	mov x15,100     //es la coordenada x del cuadrado 
	mov x3,355      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	mov x16,x15
	add x4,x4,x2
	movz x10,0x80,lsl 16  //Color que quiero pintar el 4to fragmento de poncho
	movk x10,0x2D08, lsl 00
reset_poncho4:
	mov x15,x16
	add x3,x3,1
	sub x4,x4,1
	mov x1,45 // Ancho del circulo 

loop_poncho4:
	
	cmp x15,x4             //1600 =r² 
	b.gt loop2_poncho4             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_poncho4:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_poncho4	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_poncho4         // if not last row, jump

poncho5:
	mov x11,SCREEN_WIDTH
	movz x10, 0x80, lsl 16
	movk x10, 0x2D08, lsl 00

	mov x12, 40 // modifica el ejey del poncho (en tamaño)
	mov x4, 322 // modifica el ejey del poncho (en posicion)

base_poncho5:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 90 // Distribuye en el eje x el poncho
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,40 //Anchen
loop_poncho5: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_poncho5
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_poncho5

poncho6:
	mov x0, x20

	mov x2,20       //Alto del circulo 
	mov x15,72     //es la coordenada x del cuadrado 
	mov x3,348      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	mov x16,x15
	add x4,x4,x2
	movz x10,0x80,lsl 16  //Color que quiero pintar la 6to parte del poncho sisisi muchisimo laburo el poncho
	movk x10,0x2D08, lsl 00
reset_poncho6:
	mov x15,x16
	add x3,x3,1
	sub x4,x4,1
	mov x1,20 // Ancho del circulo 

loop_poncho6:
	
	cmp x4,x15             //1600 =r² 
	b.gt loop2_poncho6            //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_poncho6:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_poncho6	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_poncho6        // if not last row, jump

poncho7:
	mov x0, x20

	mov x2,15       //Alto del circulo 
	mov x15,72     //es la coordenada x del cuadrado 
	mov x3,389      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	mov x16,x15
	add x4,x4,x2
	movz x10,0x80,lsl 16  //Color que quiero pintar la 7ma parte del poncho
	movk x10,0x2D08, lsl 00
reset_poncho7:
	mov x15,x16
	add x3,x3,1
	sub x4,x4,1
	mov x1,15 // Ancho del circulo 

loop_poncho7:
	
	cmp x4,x15             //1600 =r² 
	b.gt loop2_poncho7            //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_poncho7:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_poncho7	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_poncho7        // if not last row, jump

poncho8:
	mov x0, x20

	mov x2,15       //Alto del circulo 
	mov x15,72     //es la coordenada x del cuadrado 
	mov x3,404      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH
	mov x4,x15
	mov x16,x15
	add x4,x4,x2
	movz x10,0x80,lsl 16  //Color que quiero pintar la ultima parte del poncho
	movk x10,0x2D08, lsl 00
reset_poncho8:
	mov x15,x16
	add x3,x3,1
	sub x4,x4,1
	mov x1,15 // Ancho del circulo 
loop_poncho8:
	
	cmp x15,x4             //1600 =r² 
	b.gt loop2_poncho8           //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_poncho8:
	add x15,x15,1  	 	//Sumo en la coord x, x+1 
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_poncho8	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_poncho8        // if not last row, jump

barba:
	mov x0, x20
	mov x7,160  // x7=a 
	mov x6,265  //x6=b 

	mov x2,80       //Alto del circulo 
	mov x15,120     //es la coordenada x del cuadrado 
	mov x3,225      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH

	movz x10,0x78,lsl 16  //Color que quiero pintar el tegobi y la barba
	movk x10,0x5F4C, lsl 00 
resetbarba:
	mov x15,120
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loop_barba:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,1600             //1600 =r² 
	b.gt loop2_barba        //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_barba:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_barba	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,resetbarba         // if not last row, jump


cabeza:
	mov x0, x20
	mov x7,160  // x7=a 
	mov x6,265  //x6=b 

	mov x2,53       //Alto del circulo 
	mov x15,120     //es la coordenada x del cuadrado 
	mov x3,225      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH

	movz x10,0xA1,lsl 16  //Color que quiero pintar el marulo alias la cabeza
	movk x10,0x7D61, lsl 00 
resetcabeza:
	mov x15,120
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loop_cabeza:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,1600             //1600 =r² 
	b.gt loop2_cabeza             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_cabeza:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_cabeza	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,resetcabeza         // if not last row, jump

sombrero1:
	mov x0, x20
	mov x7,160  // x7=a 
	mov x6,245  //x6=b 

	mov x2,40       //Alto del circulo 
	mov x15,120     //es la coordenada x del cuadrado 
	mov x3,205      //coordenada y del cuadrado
	mov x11, SCREEN_WIDTH

	movz x10,0x00,lsl 16  //Color que quiero pintar el sombrero
	movk x10,0x0000, lsl 00
reset_sombrero1:
	mov x15,120
	add x3,x3,1
	mov x1,80 // Ancho del circulo 
loop_sombrero1:
	sub x4,x15,x7           //(x-a)
	madd x4, x4, x4, xzr    // (x-a)²
	sub x9,x3, x6           //(y-b)
	madd x9, x9, x9, xzr    //(y-b)²
	add x4, x4, x9          //(x-a)²+(y-b)²
	cmp x4,1600             //1600 =r² 
	b.gt loop2_sombrero1             //Si (x-a)²+(y-b)² > 2500, no pinto y paso al siguiente pixel 
	mul x0,x3,x11	        //y*640. Calculo la coordenada X del pixel que quiero actualizar
	add x0,x0,x15           //x+(y*640) 
	lsl x0,x0,2             //4*(x+(y*640)) 
	add x0,x0,x20
	stur w10,[x0]	        // Set color of pixel 
loop2_sombrero1:
	add x15,x15,1  	 	//Sumo en la coord x, x+1  
	sub x1,x1,1	        // decrement X counter
	cbnz x1,loop_sombrero1	    // If not end row jump
	sub x2,x2,1	         // Decrement Y counter
	cbnz x2,reset_sombrero1         // if not last row, jump

sombrero2:
	mov x0, x20
	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00

	mov x12, 15 // modifica el ejey del sombrero (en tamaño)
	mov x4, 240 // modifica el ejey del sombrero (en posicion)

base_sombrero2:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 100 // Distribuye en el eje x la base del sombre
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,120 //Anchen
loop_sombrero2: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_sombrero2
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_sombrero2


ceja1:

	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00

	mov x12, 4 // modifica el ejey la ceja (en tamaño)
	mov x4, 262 // modifica el ejey de la ceja (en posicion)

base_ceja1:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 142 // Distribuye en el eje x la ceja.
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,17 //Anchen
loop_ceja1: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_ceja1
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_ceja1

ceja2:

	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00

	mov x12, 4 // modifica el ejey la ceja (en tamaño)
	mov x4, 262 // modifica el ejey la ceja (en posicion)

base_ceja2:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 172 // Distribuye en el eje x la base de la ceja
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,17 //Anchen
loop_ceja2: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_ceja2
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_ceja2

ojo1:

	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00

	mov x12, 11 // modifica el ejey del ojo (en tamaño)
	mov x4, 262 // modifica el ejey del ojo (en posicion)

base_ojo1:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 179 // Distribuye en el eje x el ojo
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,6 //Anchen
loop_ojo1: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_ojo1
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_ojo1

ojo2:

	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00

	mov x12, 11 // modifica el ejey del ojo (en tamaño)
	mov x4, 262 // modifica el ejey del ojo (en posicion)

base_ojo2:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 149 // Distribuye en el eje x el ojo
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,6 //Anchen
loop_ojo2: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_ojo2
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_ojo2

boca:

	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00

	mov x12, 4 // modifica el ejey de la boca (en tamaño)
	mov x4, 285 // modifica el ejey de la boca (en posicion)

base_boca:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 157 // Distribuye en el eje x la boca // vamo bokaaaa
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,13 //Anchen
loop_boca: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_boca
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_boca

pucho:

	movz x10, 0xF7, lsl 16
	movk x10, 0xF7F7, lsl 00

	mov x12, 3 // modifica el ejey (en tamaño)
	mov x4, 285 // modifica el ejey (en posicion)

base_pucho:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 147 // Distribuye en el eje x
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,10 //Anchen
loop_pucho: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_pucho
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_pucho
ceniza:

	movz x10, 0xD0, lsl 16
	movk x10, 0x0000, lsl 00

	mov x12, 3 // modifica el ejey de la ceniza de cigarrillo (en tamaño)
	mov x4, 285 // modifica el ejey de la ceniza de cigarrillo (en posicion)

base_ceniza:
    mul x0,x4,x11 //Calcula la posicion de memoria del pixel
	add x0,x0, 143 // Distribuye en el eje x la ceniza de cigarrillo
	lsl x0,x0,2
	add x0,x0,x20
	mov x13,4 //Anchen
loop_ceniza: 
     stur w10,[x0]
	 add x0,x0,4
	 sub x13,x13,1
	 cbnz x13, loop_ceniza
	 sub x12,x12,1
	 add x4,x4,1
	 cbnz x12, base_ceniza


    add sp,sp,8
	ldur lr, [sp]
	br lr
	

.endif

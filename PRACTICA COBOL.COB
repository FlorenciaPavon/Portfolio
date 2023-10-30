  ******************************************************************
      * Author:Florencia Pavón
      * Date: 2023/6/16
      * Purpose: Project
      * Tectonics: cobc
      * CONTROL "FCOLOR = VIOLET"
      * STOP Pausa en la terminal
      * al final del accept se puede poner UPPER para que haga mayus a todos
      * puedo poner tambien la linea y columna donde quiero que aparezca el CURSOR
      * tambien se puede usar en DISPLAY
      * formato de nros, son 9 nros pero puedo poner pic zzzzzzzzz9.99 y entiende
      * que es max un cero nomas, y dos decimales
      * modificaciones o sobreescrituras: utilizo move to para que le asigne

      *la nueva opcion debe tener aux (puede ser 77)
      *se puede usar NEXT SENTECE para que salga del ciclo
      *puedo usar una bandera y sobrepasarla para que salga si quiere
      *    low-value, en codigo ascii es 0 o vacio, usamos eso con move PARA
      * que quede vacio o disponible
      * inspect se usa con str y talling que cuenmta caracteres al final hay que
      * poner for characters. Sirve para verificar como las variables tienens
      * tamaños predeterminadps, podes validar eso.
      * tambien se puede usar for all con inspect, y me cuenta despues
      *de for all (ejemplo for all a).
      *tambien se usa con for characters before initial " ". me cuenta todos
      *los caracteres hasta que halla un espacio, tambien puedo poner after initial " "
      *for leading "j"(primer letra), si no tiene ese caracter te da 0 y sino da 1
      *inspect + replacing characters by "letra". Reemplaza todo.
      *o replacing "e" by "a" por ejemplo
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REGISTRO-DE-EMPLEADOS.


       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       77 WKS-NOMBRE                          PIC A(30).
       77 WKS-FIN                             PIC 9(02).
       77 WKS-CANT-REG                        PIC 9(01).
       77 WKS-OPCION-MENU                     PIC 9(01).
       77 WKS-MENU-ID                         PIC 9(02).
       77 WKS-SINO                            PIC A(01).

       01 WKS-REGISTRO-EMPLEADO OCCURS 10 TIMES
                                       INDEXED BY WKS-INDICE.
           05 WKS-DATOS-EMP.
               10 WKS-NOMBRES-EMP             PIC A(30).
               10 WKS-APELLIDOS-EMP           PIC A(30).
           05 WKS-EDAD-EMP                    PIC 9(02).
           05 WKS-SALARIO-EMP                 PIC 9(08)V99.
           05 WKS-ID-EMP                      PIC 9(03).
           05 WKS-HORARIO                           PIC 9(10).
           05 WKS-DIRECCION                       PIC X(50).

       01 WKS-BANDERA                         PIC 9(01).
           88 WKS-TRUE                        VALUE 1.
           88 WKS-FALSE                       VALUE 0.

       PROCEDURE DIVISION.
           MAIN-PROCEDURE.
               DISPLAY "BIENVENIDO AL PROGRAMA".
               DISPLAY "Ingresa tu nombre: ".
               ACCEPT WKS-NOMBRE.
               DISPLAY "Hola ", WKS-NOMBRE.

       00001-IMPRIMIR-DATOS.

           DISPLAY "INGRESE EL ID DEL EMPLEADO:"
           ACCEPT WKS-MENU-ID.

           SEARCH WKS-REGISTRO-EMPLEADO
               AT END DISPLAY "Empleado no encontrado."
               WHEN  WKS-INDICE = WKS-MENU-ID


               DISPLAY "MOSTRANDO DATOS DEL EMPLEADO CON ID",WKS-MENU-ID.
               DISPLAY "ID", WKS-ID-EMP(WKS-CANT-REG).
               DISPLAY"NOMBRE EMPLEADO:", WKS-NOMBRES-EMP(WKS-CANT-REG).
               DISPLAY "APELLIDO:", WKS-APELLIDOS-EMP(WKS-CANT-REG).
               DISPLAY "EDAD:", WKS-EDAD-EMP(WKS-CANT-REG).
               DISPLAY "HORARIO", WKS-HORARIO(WKS-CANT-REG).
               DISPLAY "DIRECCION:", WKS-DIRECCION(WKS-CANT-REG).
               DISPLAY "SALARIO:", WKS-SALARIO-EMP(WKS-CANT-REG).


       00001-MENU.
               DISPLAY "Ingrese el número de la opción deseada:"
               DISPLAY "1 - Agregar empleados al Registro"
               DISPLAY "2 - Ver datos de empleados"
               ACCEPT WKS-OPCION-MENU.

               IF WKS-OPCION-MENU = 1
                   PERFORM 00001-INGRESAR-DATOS
               ELSE IF WKS-OPCION-MENU = 2
                   PERFORM 00001-IMPRIMIR-DATOS
               ELSE
                   DISPLAY "OPCIÓN INVÁLIDA"
                   PERFORM 00001-MENU
               END-IF.


       00001-MAIN-SECCION SECTION.
           DISPLAY "REGISTRO DE EMPLEADOS".
           MOVE 1 TO WKS-FIN.
           MOVE 1 TO WKS-CANT-REG.
           PERFORM 00001-INGRESAR-DATOS UNTIL WKS-CANT-REG=10.

       00001-INGRESAR-DATOS.
           DISPLAY "AGREGAR UN EMPLEADO".
           DISPLAY "Ingrese el/los nombres del empleado:".
           ACCEPT WKS-NOMBRES-EMP(WKS-CANT-REG).

           DISPLAY "Ingrese el/los apellidos del empleado:".
           ACCEPT WKS-APELLIDOS-EMP(WKS-CANT-REG).

           DISPLAY "Ingrese la edad del empleado:".
           ACCEPT WKS-EDAD-EMP(WKS-CANT-REG).

           DISPLAY "Ingrese la direccion: ".
           ACCEPT WKS-DIRECCION(WKS-CANT-REG).

           DISPLAY "Ingrese el horario:".
           ACCEPT WKS-HORARIO(WKS-CANT-REG).

           DISPLAY "Ingrese el salario:".
           ACCEPT WKS-SALARIO-EMP(WKS-CANT-REG).

           ADD 10 TO WKS-ID-EMP(WKS-CANT-REG).
           ADD 1 TO WKS-FIN.
           ADD 1 TO WKS-CANT-REG .

           DISPLAY "Desea agregar otro empleado? S- Si, N-No".
           ACCEPT WKS-SINO UPPER.

           IF WKS-SINO = "S"
               PERFORM 00001-INGRESAR-DATOS UNTIL WKS-CANT-REG=10
           ELSE IF WKS-SINO = "N"
               PERFORM 00001-MENU





           STOP RUN.
       END PROGRAM REGISTRO-DE-EMPLEADOS.

window.onload=iniciar;

function iniciar()
{
     // Cuando el documento esté cargado asignaremos los eventos siguientes.
     // Al hacer click en el botón de enviar tendrá que llamar a la validación del miformulario.
     document.getElementById("enviar").addEventListener('click',validar,false);
     // Asignamos que cuando pierda el foco el Nombre y los apellidos ponga en mayúsculas las Iniciales.
     document.getElementById("nombre").addEventListener('blur',mayusculas,false);
     document.getElementById("apellidos").addEventListener('blur',mayusculas,false);
}

function validar(eventopordefecto)     // En la variable que pongamos aquí gestionaremos el evento por defecto.
{
     if (contadorIntentos() && validarcampostextoYEdad("0,1,2") && validarNIF() && validarEmail() && validarProvincia() && validarFecha() && validarTelefono() && validarHora() && confirmarEnvio())
          return true;
     else
     {
          // Cancelamos el evento de envío por defecto asignado al boton de submit enviar.
          eventopordefecto.preventDefault();          
          return false;     // Sale de la función devolviendo false.
     }
}

function mayusculas()
{
     this.value=this.value.toUpperCase();
}

// A esta función se le pasa el índice de los campos de texto que queremos que valide solamente si contienen
// o no contienen valores.
function validarcampostextoYEdad(campos)
{
     var miformulario = document.getElementById("formulario");
     var camposchequear=campos.split(",");
     for (var i=0; i<camposchequear.length; i++)
     {

        // Eliminamos la clase error si es que estaba asignada a algún campo anteriormente.
        miformulario.elements[camposchequear[i]].className="";
        if (miformulario.elements[camposchequear[i]].type == "text" && miformulario.elements[camposchequear[i]].value=="")
        {
            document.getElementById("errores").innerHTML="El campo: "+miformulario.elements[camposchequear[i]].name+" no puede estar en blanco";
            miformulario.elements[camposchequear[i]].focus();
            miformulario.elements[camposchequear[i]].className="error";
            return false;
        }

        // Chequeamos el campo edad.
        else if (miformulario.elements[camposchequear[i]].id=="edad")
        {
            if (isNaN(miformulario.elements[camposchequear[i]].value) || miformulario.elements[camposchequear[i]].value <0 || miformulario.elements[camposchequear[i]].value >105)
            {
                    document.getElementById("errores").innerHTML="El campo: "+miformulario.elements[camposchequear[i]].name.toUpperCase()+" posee valores incorrectos";
                    miformulario.elements[camposchequear[i]].focus();
                    miformulario.elements[camposchequear[i]].className="error";
                    return false;
            }
        }
     }
     return true;      // Si sale de la función por aquí es que todos los campos de texto y la edad son válidos.
}

function validarNIF()
{
     // 8 números - Letra
     var patron = /^\d{8}-[A-Z]{1}$/;
     if (patron.test(document.getElementById("nif").value))
          return true;
     else
     {
          document.getElementById("errores").innerHTML="El campo: NIF está incorrecto.<br />Formato 8 digitos-Letra Mayúscula";
          document.getElementById("nif").focus();
          document.getElementById("nif").className="error";
          return false;
     }
}

function validarEmail()
{
    /*
    // Explicación de la Expresión Regular para validar el e-mail:
    /^[-zA-Z0-9._-]+  Indica que el e-mail debe comenzar con caracteres alfanuméricos, en 
    mayúsculas o minúsculas, subrayados, puntos, etc.
    @  Debe haber un símbolo de @ después de los caracteres iniciales.
    [a-zA-Z0-9.-]+: Después de la arroba puede haber caracteres alfanuméricos. También puede
    contener . y guiones -
    \. Debe haber un punto después del segundo grupo de caracteres para separar los dominios y subdominios.
    [a-zA-Z]{2,4}$/  Para terminar la dirección de e-mail debe terminar de 2 a 3 caracteres alfabéticos.
    {2,4} indica el mínimo y máximo número de caracteres. Ésto permitirá dominio con 2,3 y 4 caracteres.
    */
     // Eliminamos la clase error asignada al elemento hora.
     document.getElementById("email").className="";
     var patron = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
     if (patron.test(document.getElementById("email").value))
          return true;
     else
     {
          document.getElementById("errores").innerHTML="El campo: E-MAIL está incorrecto.";
          document.getElementById("email").focus();
          document.getElementById("email").className="error";
          return false;          
     }
}

function validarProvincia()
{
     // Eliminamos la clase error asignada al elemento hora.
     document.getElementById("provincia").className="";

     // Comprueba que la opción seleccionada sea diferente a 0.
     // Si es la 0 es que no ha seleccionado ningún nombre de Provincia.
     if (document.getElementById("provincia").selectedIndex==0)
     {
          document.getElementById("errores").innerHTML="Atención!: Debes seleccionar una PROVINCIA.";
          document.getElementById("provincia").focus();
          document.getElementById("provincia").className="error";
          return false;
     }
     else
          return true;
}

function validarFecha()
{
     // Eliminamos la clase error asignada al elemento fecha.
     document.getElementById("fecha").className="";
     // dd-mm-aaaa o bien dd/mm/aaaa
     var patron1 = /^\d{2}-\d{2}-\d{4}$/;
     var patron2 = /^\d{2}\/\d{2}\/\d{4}$/;
     if (patron1.test(document.getElementById("fecha").value) || patron2.test(document.getElementById("fecha").value))
          return true;
     else
     {
          document.getElementById("errores").innerHTML="El campo: FECHA está incorrecto.<br />Formato dd/mm/aaaa o dd-mm-aaaa";
          document.getElementById("fecha").focus();
          document.getElementById("fecha").className="error";
          return false;
     }
}

function validarTelefono()
{
     // Eliminamos la clase error asignada al elemento telefono.
     document.getElementById("telefono").className="";

     // dd-mm-aaaa o bien dd/mm/aaaa
     var patron = /^\d{9}$/;
     if (patron.test(document.getElementById("telefono").value))
          return true;
     else
     {
          document.getElementById("errores").innerHTML="El campo: TELEFONO está incorrecto.<br/>Sólo números y máximo de 9 dígitos";
          document.getElementById("telefono").focus();
          document.getElementById("telefono").className="error";
          return false;
     }
}

function validarHora()
{
     // Eliminamos la clase error asignada al elemento hora.
     document.getElementById("hora").className="";

     // 4 números separados por :
     var patron = /^\d{2}:\d{2}$/;
     if (patron.test(document.getElementById("hora").value))
          return true;
     else
     {
          document.getElementById("errores").innerHTML="El campo: HORA está incorrecto.<br/>Formato: HH:MM";
          document.getElementById("hora").focus();
          document.getElementById("hora").className="error";
          return false;
     }
}

function contadorIntentos()
{
     var contador=0;
     // Si no existe la cookie la creamos y grabamos el texto contador=0.
     if (document.cookie == "")
          document.cookie="contador=0";
     contador=document.cookie.substring(9);
     contador++;
     document.cookie="contador="+contador;
     document.getElementById("intentos").innerHTML="Intento de Envíos del formulario: "+contador+".";
     return true;
}

function confirmarEnvio()
{
     document.getElementById("errores").innerHTML="";
     return confirm("¿Deseas enviar el formulario?");
}
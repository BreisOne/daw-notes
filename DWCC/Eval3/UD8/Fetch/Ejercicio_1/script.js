'use strict'
var div_usuarios=document.querySelector('#usuarios');
// .Ofrece una API para acceder a recursos tipicos como usuarios, mensajes de un foro y fotos
var usuarios=[];
//fetch('https://jsonplaceholder.typicode.com/users')
fetch('https://reqres.in/api/users')
        .then (data=>data.json())
        .then (users=> {
                    
            usuarios = users.data;
            console.log(usuarios);
            
            //Crea un nuevo array con los resultadosde la función
            usuarios.map((user,i)=> {
                    
                let nombre = document.createElement("h2");
                nombre.innerHTML = i + " " +user.first_name;
                div_usuarios.appendChild(nombre);
                            
            });
            // Creamos  la visualización de un objeto

            let object = document.createElement("p");
            let separador1 = document.createElement("hr");
            let separador2 = document.createElement("hr");
            object.innerText = `{"nombre": ${usuarios[0].first_name},"apellidos": ${usuarios[0].last_name}, "url": ${usuarios[0].avatar}}`; //JSON.stringify(usuarios[0]);
            div_usuarios.appendChild(separador1);
            div_usuarios.appendChild(object);
            div_usuarios.appendChild(separador2);
            
            let name = document.createElement("h2");
            name.innerHTML = `${usuarios[1].first_name} ${usuarios[1].last_name}`
            div_usuarios.appendChild(name);

            let image = document.createElement("img");
            image.src = usuarios[1].avatar;
            div_usuarios.appendChild(image);

            
        });
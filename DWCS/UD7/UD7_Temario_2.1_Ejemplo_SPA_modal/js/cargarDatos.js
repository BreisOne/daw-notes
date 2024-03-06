/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */


function getRoles() {
    let roles_url = "?controller=Usuario&action=getRoles";

    fetch(base_url + roles_url)
            .then(response => {
                roles = response.json();
                return roles;

            })
            .then(roles => {
                buildRolesSelect(roles);
            }).catch((error) => {
        console.log('Ha ocurrido un error: ' + error);
    });
}



function buildRolesSelect(roles) {
    let select_roles = document.querySelector('#rol');
    for (let i = 0; i < roles.length; i++) {
        let option = '<option value="' + roles[i].id + '">' + roles[i].name + '</option>';
        select_roles.innerHTML += option;
    }
}
const createItem = function(event){
    let text = document.getElementById("text").value;
    let btnValue = event.target.value;
    
    let item = document.createElement(btnValue);

    item.innerText = text;
}

document.addEventListener("DOMContentLoaded", () => {
    
    
});
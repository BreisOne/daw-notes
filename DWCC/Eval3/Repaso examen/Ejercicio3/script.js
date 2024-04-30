const deleteItem = (event) => {
    let targetParentNode = event.target.parentNode;
    targetParentNode.remove();
}
const createItem = function (event) {
    let text = document.getElementById("text").value;
    let btnValue = event.target.value;
    let btnBorrar = document.createElement("input:buton");
    btnBorrar.addEventListener("click", deleteItem);
    let containerDiv = document.createElement("div");

    let item = document.createElement(btnValue);
    item.innerText = text;
    
    containerDiv.appendChild(item);
    containerDiv.appendChild(btnBorrar);

    let results = document.getElementById("resultado");

    results.appendChild(containerDiv);
}

document.addEventListener("DOMContentLoaded", () => {
    
    let btns = document.querySelectorAll("input");
    console.log(btns);
    
    btns.map(btn => {
        btn.addEventListener("click", createItem);
    })
});
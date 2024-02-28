

window.onload = function () {
    onceLoaded();

};
//https://jsonplaceholder.typicode.com/guide/
function onceLoaded() {
    fetch('https://jsonplaceholder.typicode.com/posts', {
        method: 'POST',
        body: JSON.stringify({
            title: 'foo',
            body: 'bar',
            userId: 1
        }),
        headers: {
            'Content-type': 'application/json; charset=UTF-8'
        }
    })
        .then((response) => response.json())
        .then((json) => {
            console.log(json);
            let usersSection = document.getElementById("users");
            let ulElement = document.createElement("ul");

            // Iterate through the object json
            for (const key in json) {
                if (json.hasOwnProperty(key)) {
                    //Template literals are enclosed in backticks (`) instead of single or double quotes. They allow you to embed expressions directly within the string using placeholders, denoted by ${expression}. The dollar sign followed by curly braces ${} is used to evaluate and embed expressions dynamically in template literals.
                    console.log(`${key}: ${json[key]}`);
                    let liElement = document.createElement("li");
                    liElement.innerHTML = `${key}: ${json[key]}`;
                    ulElement.appendChild(liElement);
                }
            }
           
            usersSection.appendChild(ulElement);

        })
        .catch((err) => console.error("error:", err));

}

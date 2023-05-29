var app=()=>{
    fetch("http://127.0.0.1:5500/sample.html")
        .then(Response=> Response.text())
        .then(data=>{var parser = new DOMParser;
        var doct = parser.parseFromString(data,"text/html")
        var name = doct.querySelector("p").textContent;
        var roll = doct.querySelector("h2").textContent;
        var DOB = doct.querySelector("h3").textContent;

    document.getElementById("uname").innerHTML= name;
    document.getElementById("roll").innerHTML= roll;
    document.getElementById("dob").innerHTML= DOB;

    });
}

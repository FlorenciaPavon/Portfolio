function validar() {    
    let user = document.getElementById("user").value;
    let pass = document.getElementById("pass").value;

     if (user == "RELeiva" && pass == "pass") {        
         window.location = "./index.html";

    } else {        
         alert("Incorrecto, intente nuevamente");
    }
    return loggedIn

    
};

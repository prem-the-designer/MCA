var nameError = document.getElementById('nameError')
var phoneError = document.getElementById('phoneError')
var emailError = document.getElementById('emailError')
var messageError = document.getElementById('messageError')
var formError = document.getElementById('formError')

function validateName(){
    var name = document.getElementById('contact-name').value;

    if(name.length==0){
        nameError.innerHTML='Name is required';
        return false;
    }
    if(!name.match(/^[A-Za-z]*\s{1}[A-Za-z]*$/)){
        nameError.innerHTML="Requires Full Name";
        return false;
    }
    nameError.innerHTML='valid';
    return true;
}
function validatePhone(){
    var phone = document.getElementById('contact-phone').value;

    if(phone.length==0){
        phoneError.innerHTML='Phone is required';
        return false;
    }
    if(phone.length!=10){
        phoneError.innerHTML="Only 10 numbers is allowed"
        return false;
    }

    if(!phone.match(/^[0-9]{10}$/)){
        phoneError.innerHTML="Only numbers are allowed";
        return false;
    }
    phoneError.innerHTML='valid';
    return true;
}

function validateEmail(){
    var email = document.getElementById('contact-email').value;

    if(email.length==0){
        emailError.innerHTML='Email is required';
        return false;
    }
    
    if(!email.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)){
        emailError.innerHTML="Enter valid email address";
        return false;
    }
    emailError.innerHTML='valid';
    return true;
}
function validateMessage(){
    var message = document.getElementById('contact-message').value;
    var required=30;
    var left= required - message.length;

    if(left>0){
        messageError.innerHTML=left + ' more charcters required';
        return false;
    }
    
    messageError.innerHTML='valid';
    return true;
}

document.getElementById("myForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent the default form submission
    
    // Get the form error element
    var formError = document.getElementById("formError");
    
    // Show success message
    if (!validateName() || !validatePhone() || !validateEmail() || !validateMessage()) {
        formError.style.display = 'block';
        formError.innerHTML = "Please fill the required fields";
        setTimeout(function() {
            formError.style.display = 'none';
        }, 3000);
        return false;
    } else {
        // Redirect to the success page after a short delay
        setTimeout(function() {
            window.location.href = "success.html";
        }, 1000);
    }
});


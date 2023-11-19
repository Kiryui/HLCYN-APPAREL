const container=document.querySelector('.container');
const LoginLink=document.querySelector('.SignInLink')
const RegisterLink=document.querySelector('.SignUpLink')
const input = document.querySelector('input');
const Eyecon = document.querySelectorAll('.Eyecon');
const x=document.querySelectorAll('#MyInput')

//Password show/hide icon button
for(let i=0;i<Eyecon.length;i++){
    Eyecon[i].addEventListener('click',()=>{
        if(x[i].type==="password"){
            x[i].type="text";
            Eyecon[i].classList.add('fa-eye')
            Eyecon[i].classList.remove('fa-eye-slash')
        }
        else{
            x[i].type="password";
            Eyecon[i].classList.remove('fa-eye')
            Eyecon[i].classList.add('fa-eye-slash')
        }
    })
}

//Sign In and Sign Up button
RegisterLink.addEventListener('click',()=>{
    container.classList.add('active');
})
LoginLink.addEventListener('click',()=>{
    container.classList.remove('active');
})

input.addEventListener('focus', function() {
    this.style.outline = 'none';
  });
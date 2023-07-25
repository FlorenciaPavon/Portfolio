// let linkLeerMas =document.getElementsByClassName('linkLeerMas');

// let ocultar_texto = document.getElementsByClassName('ocultar');

// link_ocultar_texto.addEventListener('click', toggleText);

// function toggleText() {
//     ocultar_texto.classList.toggle('mostrar');
// }

// let linkLeerMas = document.getElementsByClassName('linkLeerMas');
// let ocultar_texto = document.getElementsByClassName('ocultar');

// for (let i = 0; i < linkLeerMas.length; i++) {
//   linkLeerMas[i].addEventListener('click', toggleText);
// }

// function toggleText() {
//   for (let i = 0; i < ocultar_texto.length; i++) {
//     ocultar_texto[i].classList.toggle('mostrar');
//   }
// }

// let linkLeerMas = document.getElementsByClassName('linkLeerMas');
// let ocultar_texto = document.getElementsByClassName('ocultar');

// for (let i = 0; i < linkLeerMas.length; i++) {
//   linkLeerMas[i].addEventListener('click', toggleText.bind(null, i));
// }

// function toggleText(index) {
//   for (let i = 0; i < ocultar_texto.length; i++) {
//     if (i === index) {
//       ocultar_texto[i].classList.toggle('mostrar');
//     } else {
//       ocultar_texto[i].classList.remove('mostrar');
//     }
//   }
// }

let linkLeerMas = document.getElementsByClassName('linkLeerMas');
let ocultar_texto = document.getElementsByClassName('ocultar');

for (let i = 0; i < linkLeerMas.length; i++) {
  linkLeerMas[i].addEventListener('click', toggleText.bind(null, i));
}

function toggleText(index) {
  for (let i = 0; i < ocultar_texto.length; i++) {
    if (i === index) {
      ocultar_texto[i].classList.toggle('mostrar');
      linkLeerMas[i].textContent = ocultar_texto[i].classList.contains('mostrar') ? 'Leer Menos' : 'Leer Más';
    } else {
      ocultar_texto[i].classList.remove('mostrar');
      linkLeerMas[i].textContent = 'Leer Más';
    }
  }
}

  
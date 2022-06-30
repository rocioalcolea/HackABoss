"use strict";

const formCuadrados = document.forms[0];
let contador = 9;
const div1 = document.querySelector("form div");

formCuadrados.addEventListener("submit", addCuadrado);
function digitoRandom() {
  const digitos = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
  ];
  const digito = (Math.random() * 15).toFixed(0);
  return digitos[digito];
}

function color() {
  let color = "";
  for (let j = 0; j < 6; j++) {
    color = color + digitoRandom();
  }
  return "#" + color;
}

function generarColores() {
  for (let i = 0; i < div1.childElementCount; i++) {
    document.getElementById(`${i}`).style.backgroundColor = color();
  }
}

function addCuadrado(event) {
  event.preventDefault();
  const div = document.createElement("div");
  div.setAttribute("id", contador);
  div1.appendChild(div);
  contador++;
  generarColores();
}

let intervalo = setInterval(() => generarColores(), 1000);

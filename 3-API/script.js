"use strict";

const userUrl = "https://randomuser.me/api/";
const persona = new Object();

async function getUser(url) {
  try {
    const response = await fetch(url);
    const usuario = await response.json();

    const name =
      usuario.results[0].name.first + " " + usuario.results[0].name.last;
    const pais = usuario.results[0].location.country;
    const email = usuario.results[0].email;
    const foto = usuario.results[0].picture.medium;
    persona.nombre = name;
    persona.pais = pais;
    persona.email = email;
    persona.foto = foto;
  } catch (error) {
    console.log("tenemos un error", error.message);
  }
  return persona;
}

async function addCard(numeroCard) {
  const mainElement = document.querySelector("main");

  const ul = document.createElement("ul");
  mainElement.append(ul);

  for (let i = 0; i < numeroCard; i++) {
    const li = document.createElement("li");
    const imagen = document.createElement("img");
    const person = await getUser(userUrl);
    imagen.src = person.foto;
    li.append(imagen);
    const nombre = document.createElement("h2");
    nombre.textContent = person.nombre + " " + person.pais;
    li.append(nombre);
    const mail = document.createElement("a");
    mail.href = person.email;
    mail.textContent = person.email;
    li.append(mail);
    const pais = document.createElement("p");
    pais.textContent = person.pais;
    li.append(pais);
    ul.append(li);
  }
}

let numeroElementos = prompt("introduce cuantas personas deseas visualizar");
addCard(numeroElementos);

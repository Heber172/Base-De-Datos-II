const { Client, NoAuth, MessageMedia, Buttons } = require('whatsapp-web.js');
const qrcode = require('qrcode-terminal');
const mysql = require('mysql');

const conection = mysql.createConnection({
    host: 'localhost',
    user: 'Heber',
    password: '123456',
    database: 'chatbotwhatsapp'
});

conection.connect((err) => {
    if (err) throw err
    console.log('La conexion funciona')
});



const client = new Client({
    authStrategy: new NoAuth()
});

client.on('qr', (qr) => {
    qrcode.generate(qr, { small: true });
});

client.on('ready', () => {
    console.log('Client is ready!');
});

const ClienSaludo = [
    'Hola',
    'Buenas',
    'Buenos días',
    'Buenas tardes',
    'Buenas noches',
    '¿Hola, estás ahí?',
    '¿Hola, me puedes ayudar?',
    'Necesito ayuda',
    '¿Puedes responder preguntas?',
    '¡Hola! ¿Qué puedes hacer?',
    'Hey',
    'Saludos',
    'Quisiera hacer una consulta',
    'Hola, necesito asistencia',
    'Hola, ¿puedes darme información?',
    '¿Tienes un momento?',
    '¿Me puedes orientar?',
    'Buen día',
    'Hola, ¿qué servicios ofreces?',
    '¿Cuál es tu función?'
];
const nombres = [
    'María',
    'Juan',
    'Jose',
    'Luis',
    'Carlos',
    'Mario',
    'Jorge',
    'Juana',
    'Víctor',
    'Ana',
    'Martha',
    'Carmen',
    'Miguel',
    'Rosa',
    'Vida',
    'Pedro',
    'Antonio',
    'Fernando',
    'Roberto',
    'Félix',
    'Julio',
    'Julia',
    'René',
    'Javier',
    'Ángel',
    'Alberto',
    'David',
    'Freddy',
    'Elizabeth',
    'Óscar',
    'Hugo',
    'Daniel',
    'Cristina',
    'Francisco',
    'Lidia',
    'Patricia',
    'Sonia',
    'Edwin',
    'Eduardo',
    'Isabel',
    'Raúl',
    'Silvia',
    'Jaime',
    'Victoria',
    'Elena',
    'Édgar',
    'Pablo',
    'Alejandro',
    'Jesús',
    'Roxana',
    'Claudia',
    'Virginia',
    'Teresa',
    'Margarita',
    'Rosario',
    'Marco',
    'Ricardo',
    'Rubén',
    'Verónica',
    'Alfredo',
    'Sandra',
    'Ramiro',
    'Lucía',
    'Germán',
    'Lourdes',
    'Beatriz',
    'Rolando',
    'Marina',
    'Walter',
    'Nancy',
    'Francisca',
    'Andrés',
    'Marcelo',
    'Angelica',
    'Ruth',
    'Jhonny',
    'Luisa',
    'Laura',
    'Rosmery',
    'Paulina',
    'Gonzalo',
    'Gabriela',
    'Justina',
    'Manuel',
    'Felipe',
    'Gregorio',
    'Martín',
    'César',
    'Alicia',
    'Andrea',
    'Flora',
    'Celia',
    'Miriam',
    'Ronald',
    'Wilson',
    'Gladys',
    'Mary',
    'Mercedes',
    'Susana',
    'Mónica',
    'Hans', 'Brayan', 'Bryan', 'William', 'Cristhian'
];
const apellido = ["Mamani", "Flores", "Quispe", "Choque", "Vargas", "Condori", "Rodríguez", "Rojas", "Gutiérrez", "López", "Fernández", "Gonzales", "García", "Cruz", "Pérez", "Mendoza", "Sánchez", "Martínez", "Chávez",
    "Ramos",
    "Apaza",
    "Huanca",
    "Vaca",
    "Torrez",
    "Guzmán",
    "Suárez",
    "Aguilar",
    "Justiniano",
    "Romero",
    "Colque",
    "Cuéllar",
    "Ramírez",
    "Vásquez",
    "Soliz",
    "Miranda",
    "Villca",
    "Morales",
    "Álvarez",
    "Ortiz",
    "Espinoza",
    "Ticona",
    "Villarroel",
    "Chambi",
    "Castro",
    "Calle",
    "Durán",
    "Méndez",
    "Jiménez",
    "Nina",
    "Gómez",
    "Rocha",
    "Salazar",
    "Cespedes",
    "Hurtado",
    "Torrico",
    "Herrera",
    "Camacho",
    "Ríos",
    "Velásquez",
    "Rivero",
    "Mercado",
    "Roca",
    "Rivera",
    "Poma",
    "Limachi",
    "Salvatierra",
    "Ruiz",
    "Escobar",
    "Arias",
    "Zambrana",
    "Saavedra",
    "Tapia",
    "Orellana",
    "Pinto",
    "Paz",
    "Padilla",
    "Molina",
    "Quisbert",
    "Montaño",
    "Ortega",
    "Velasco",
    "Laura",
    "Ayala",
    "Cabrera",
    "Zurita",
    "Callisaya",
    "Zárate",
    "Cortez",
    "Medina",
    "León",
    "Terrazas",
    "Quiroga",
    "Calderón",
    "Yucra",
    "Claros",
    "Montero",
    "Aguilera",
    "Zeballos",
    "Mejía",
    "Paredes"
];

const gen = ['Hombre', 'Masculino', 'Mujer', 'Femenino', 'hombre', 'mujer', 'femenino', 'masculino'];
const edadCl = [ 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70];
const TermCI = ['LP', 'CBBA', 'SCZ', 'PTS', 'ORU', 'CHQ', 'TJA', 'BEN', 'PAN','lp', 'cbba', 'scz', 'pts', 'oru', 'chq', 'tja', 'ben', 'pan'];



class Usuario{
    constructor(){
        this.nombre = '';
        this.apellido = '';
        this.genero = '';
        this.edad = '';
        this.altura = '';
    }

    getNombre(){
        return this.nombre;
    }
    getApellido(){
        return this.apellido;
    }
    getGenero(){
        return this.genero;
    }
    getEdad(){
        return this.edad;
    }
    getAltura(){
        return this.altura;
    }
    setNombre(nombre){
        this.nombre = nombre
    }
    setApellido(apellido){
        this.apellido = apellido;
    }
    setGenero(genero){
        this.genero = this.genero
    }
    setEdad(edad){
        this.edad = edad;
    }
    setAltura(){
        this.altura = this.altura;
    }

    mostrar(){
       client.sendMessage(message.from, 'Datos de usuario');
       client.sendMessage(message.from, `Hola, ${this.nombre}  ${this.apellido}!`);
       client.sendMessage(message.from,"Genero: "+ this.genero);
       client.sendMessage(message.from,"Edad: "+ this.edad);
       client.sendMessage(message.from,'Altura: '+ this.altura + "cm");
    }

}


class Rutina {
    constructor() {
        this.Pecho = "Press de banca con barra: 4-6 series de 9-13 repeticiones\nPress de banca inclinado con mancuernas: 4-6 series de 9-13 repeticiones\nFondos en paralelas: 4-6 series de 9-13 repeticiones\nAperturas con mancuernas en banco plano: 4-6 series de 9-13 repeticiones\nPullover con mancuerna: 4-6 series de 9-13 repeticiones\nFlexiones de pecho: 4-6 series de 9-13 repeticiones";
        this.Espalda = "Dominadas: 4-6 series de 9-13 repeticiones\nRemo con barra: 4-6 series de 9-13 repeticiones\nRemo con mancuernas: 4-6 series de 9-13 repeticiones\nJalones en polea alta: 4-6 series de 9-13 repeticiones\nPeso muerto: 4-6 series de 9-13 repeticiones\nHiperextensiones: 4-6 series de 9-13 repeticiones";
        this.Hombros = "Press militar con barra: 4-6 series de 9-13 repeticiones\nElevaciones laterales con mancuernas: 4-6 series de 9-13 repeticiones\nPájaros con mancuernas: 4-6 series de 9-13 repeticiones\nPress Arnold: 4-6 series de 9-13 repeticiones\nRemo al mentón: 4-6 series de 9-13 repeticiones\nEncogimientos de hombros con mancuernas: 4-6 series de 9-13 repeticiones";
        this.Piernas = "Sentadillas con barra: 4-6 series de 9-13 repeticiones\nPrensa de piernas: 4-6 series de 9-13 repeticiones\nZancadas con mancuernas: 4-6 series de 9-13 repeticiones\nExtensiones de piernas en máquina: 4-6 series de 9-13 repeticiones\nCurl de piernas acostado: 4-6 series de 9-13 repeticiones\nElevaciones de talones de pie: 4-6 series de 9-13 repeticiones";
        this.Biceps = "Curl de bíceps con barra: 4-6 series de 9-13 repeticiones\nCurl de bíceps con mancuernas: 4-6 series de 9-13 repeticiones\nCurl martillo con mancuernas: 4-6 series de 9-13 repeticiones\nCurl concentrado: 4-6 series de 9-13 repeticiones\nCurl de predicador con barra EZ: 4-6 series de 9-13 repeticiones\nDominadas supinas: 4-6 series de 9-13 repeticiones";
        this.Triceps = "Fondos en paralelas: 4-6 series de 9-13 repeticiones\nExtensiones de tríceps con mancuernas: 4-6 series de 9-13 repeticiones\nPress francés con barra EZ: 4-6 series de 9-13 repeticiones\nPatadas de tríceps con mancuernas: 4-6 series de 9-13 repeticiones\nPushdowns de tríceps en polea: 4-6 series de 9-13 repeticiones\nPress de banca cerrado con barra: 4-6 series de 9-13 repeticiones";
        this.Abdominales = "Crunch abdominal: 4-6 series de 9-13 repeticiones\nElevación de piernas colgado: 4-6 series de 9-13 repeticiones\nPlancha: 4-6 series de 30-60 segundos\nRussian twists: 4-6 series de 9-13 repeticiones\nAbdominales bicicleta: 4-6 series de 9-13 repeticiones\nAbdominales en rueda: 4-6 series de 9-13 repeticiones";
    }

    getPecho() {
        return this.Pecho;
    }
    getEspalda() {
        return this.Espalda;
    }
    getHombros() {
        return this.Hombros;

    }
    getPiernas() {
        return this.Piernas;
    }
    getBiceps() {
        return this.Biceps;
    }
    getTriceps() {
        return this.Triceps;
    }
    getAbdominales() {
        return this.Abdominales;
    }
}


function registrarUsuario(ci, nombre, apellido, edad, genero) {
    /*/ Configurar la conexión a la base de datos
    const connection = mysql.createConnection({
      host: 'localhost',
      user: 'tu_usuario',
      password: 'tu_contraseña',
      database: 'nombre_de_la_base_de_datos'
    });
    */
  
    // Establecer la consulta SQL para insertar el usuario
    const sql = 'INSERT INTO usuario (Ci, nombre, apellido, edad, genero) VALUES (?, ?, ?, ?, ?)';
    const values = [ci, nombre, apellido, edad, genero];
  
    // Ejecutar la consulta
    connection.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error al registrar el usuario:', error);
        return;
      }
      console.log('Usuario registrado correctamente');
    });
  
    /* Cerrar la conexión
    connection.end();*/
  }





const ruti = new Rutina();


let finDeOpciones = false;
let procesoTerminado = false;
let activarOpciones_1_2 = false;
let activarSwichOpciones = false;
let nombreCliente ='';
let apll='';
let gener='';
let anio='';
let ci='';

client.on('message', message => {
    if (procesoTerminado === false) {

        const insertar = "INSERT INTO mensajeria (numero_celular_CLIENTE, mensaje_eviado, mensaje_recibido) values(?,?,?)";

        if (ClienSaludo.includes(message.body)) {
            client.sendMessage(message.from, 'Hola, bienvenido/a a nuestro chatbot de fitness. ');
            client.sendMessage(message.from, '¿Cuál es tu nombre?');
            conection.query(insertar, [message.from, 'Hola, bienvenido/a a nuestro chatbot de fitness. ¿Cuál es tu nombre? ', message.body], (err)  =>{
                if(err) throw err
                console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
            })
        
        }
        else if (nombres.includes(message.body)) {
            nombreCliente = message.body.trim();
            client.sendMessage(message.from, `Hola, ${nombreCliente}!`);
            client.sendMessage(message.from, '¿Cual es tu apellido?');
            conection.query(insertar, [message.from,  '¿Cual es tu apellido?', message.body], (err)  =>{
                if(err) throw err
                console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
            })
        }
        else if (apellido.includes(message.body)) {
             apll = message.body.trim();
            client.sendMessage(message.from, '¿Cual es tu genero?');
            conection.query(insertar, [message.from,  '¿Cual es tu genero?', message.body], (err)  =>{
                if(err) throw err
                console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
            })
        }

        else if (gen.includes(message.body)) {
             gener = message.body.trim();
            client.sendMessage(message.from, 'Perfecto');
            client.sendMessage(message.from, '¿Cuántos años tienes? *(solo numero)*');

            conection.query(insertar, [message.from,'Perfecto   ¿Cuántos años tienes? *(solo numero)*', message.body], (err)  =>{
                if(err) throw err
                console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
            })
           
        }
        else if (edadCl.includes(Number(message.body))) {
             anio = message.body.trim();
            client.sendMessage(message.from, 'Entendido. ¿Cual es tu CI? ');
            client.sendMessage(message.from, 'Envia el CI con la terminacion de tu Departamento, ejemplo: 123456789 LP');

            conection.query(insertar, [message.from, 'Entendido. ¿Cual es tu CI?', message.body], (err)  =>{
                if(err) throw err
                console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
            })
        }

        else if (Number(message.body) > 100) {
            ci = message.body.trim();
            const usua = new Usuario(nombreCliente, apll, anio, gener, ci);/*
            registrarUsuario(ci, nombreCliente, apll, anio, gener);*/
           
    
            client.sendMessage(message.from, 'Gracias. Acontinuacion te dare las rutinas de ejercicios');

            conection.query(insertar, [message.from,  'Gracias. Acontinuacion te dare las rutinas de ejercicios', message.body], (err)  =>{
                if(err) throw err
                console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
            })
            /*
            usua.mostrar();
            client.sendMessage(message.from, '¿Los datos son correctos?');
            client.sendMessage(message.from, 'Confirma elijiendo un numero: \n1. Si son correctos \n 2. No son correctos');
            activarOpciones_1_2 = true;*/
           procesoTerminado = true;

        }
        
        
        /*
        else if(Number(message.body) === 1 && activarOpciones_1_2 === true){
            client.sendMessage(message.from, 'Listo se registro');
            procesoTerminado = true;
        }
        else if(Number(message.body) === 2 && activarOpciones_1_2 === true){
           
            client.sendMessage(message.from, 'Lo siento, cual dato esta mal elige una opcion *(solo numero)*: ');
            client.sendMessage(message.from, '1. Nombre \n2. Apellido \n3. Genero \n4. Edad \n5. CI ');
            activarOpciones_1_2 = false;
            finDeOpciones = true;
           
        }*/


        else {
            client.sendMessage(message.from, 'Lo siento, no reconocí tu respuesta.');
        
            conection.query(insertar, [message.from, 'Lo siento, no reconocí tu respuesta.', message.body], (err)  =>{
                if(err) throw err
                console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
            })
        }


    }
});
/*
let camNom = false;
let camAp = false;
let camEd = false;
let camGen = false;
let camAlt = false; 

client.on('message', message =>{
    if(finDeOpciones === true){
        switch(message.body){
            case '1':
                client.sendMessage(message.from, 'Ingrega el nuevo nombre');
                finDeOpciones = false;
                camNom = true;
                break;
            case '2':
                client.sendMessage(message.from, 'Ingresa tu apellido');
                finDeOpciones = false;
                camAp = true;
                break;
            case '3':
                client.sendMessage(message.from, 'Ingresa la nueva edad');
                finDeOpciones = false;
                camEd = true;
                break;
            case '4':
                client.sendMessage(message.from, 'Ingresa tu genero');
                finDeOpciones = false;
                camGen = true;
                break;
            case '5':
                client.sendMessage(message.from, 'Ingresa tu altura');
                finDeOpciones = false;
                camAlt = true;
                break;
            default:
                client.sendMessage(message.from, 'Eliga una opcion del 1 - 5');
                client.sendMessage(message.from, '1. Nombre \n2. Apellido \n3. Genero \n4. Edad \n5. Altura ');
                break;
        }
    }
    else if(camNom === true && nombres.includes(message.body)){
        setNombre(message.body);
        client.sendMessage(message.from, 'Se cambio con exito');/*
        client.sendMessage(message.from, usua.mostrar);
        camNom = false;
        
        procesoTerminado = true;
    }
    else if(camAp === true && apellido.includes(message.body)){
        setApellido(message.body);
        client.sendMessage(message.from, 'Se cambio con exito');/*
        client.sendMessage(message.from, usua.mostrar);
        camAp = false;
        procesoTerminado = true;
    }
    else if(camEd === true && edadCl.includes(message.body)){
        setEdad(message.body);
        client.sendMessage(message.from, 'Se cambio con exito');/*
        client.sendMessage(message.from, usua.mostrar);
            procesoTerminado = true;
        camEd = false;
    }
    else if(camGen === true && gen.includes(message.body)){
        setGenero(message.body);
        client.sendMessage(message.from, 'Se cambio con exito');/*
        client.sendMessage(message.from, usua.mostrar);
            procesoTerminado = true;
        camGen = false;
    }
    else if(camAlt === true && Number(message.body) > 110 && Number(message.body) < 250){
        setAltura(message.body);
        client.sendMessage(message.from, 'Se cambio con exito');/*
        client.sendMessage(message.from, usua.mostrar);
            procesoTerminado = true;
        camAlt = false;
    }
    else{
        client.searchMessages(message.from, 'Lo siento, no reconocí tu respuesta.');
    }
});
*/



let iniciarSwitch = false;
client.on('message', message => {
    if (procesoTerminado === true) {
        
        const insertar2 = "INSERT INTO mensajeria (numero_celular_CLIENTE, mensaje_eviado, mensaje_recibido) values(?,?,?)";

        if (iniciarSwitch === true) {
            switch (message.body) {
                case '1':
                    client.sendMessage(message.from, ruti.getPecho());
                    conection.query(insertar2, [message.from, ruti.getPecho(), message.body], (err)  =>{
                        if(err) throw err
                        console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
                    })

                    break;
                case '2':
                    client.sendMessage(message.from, ruti.getEspalda());
                    conection.query(insertar2, [message.from, ruti.getEspalda(), message.body], (err)  =>{
                        if(err) throw err
                        console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
                    })
                    break;
                case '3':
                    client.sendMessage(message.from, ruti.getHombros());
                    conection.query(insertar2, [message.from, ruti.getHombros(), message.body], (err)  =>{
                        if(err) throw err
                        console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
                    })
                    break;
                case '4':
                    client.sendMessage(message.from, ruti.getPiernas());
                    conection.query(insertar2, [message.from, ruti.getPiernas(), message.body], (err)  =>{
                        if(err) throw err
                        console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
                    })
                    break;
                case '5':
                    client.sendMessage(message.from, ruti.getBiceps());
                    conection.query(insertar2, [message.from, ruti.getBiceps(), message.body], (err)  =>{
                        if(err) throw err
                        console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
                    })
                    break;
                case '6':
                    client.sendMessage(message.from, ruti.getTriceps());
                    conection.query(insertar2, [message.from, ruti.getTriceps(), message.body], (err)  =>{
                        if(err) throw err
                        console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
                    })
                    break;
                case '7':
                    client.sendMessage(message.from, ruti.getAbdominales());
                    conection.query(insertar2, [message.from, ruti.getAbdominales(), message.body], (err)  =>{
                        if(err) throw err
                        console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
                    })
                    break;
                default:
                    client.sendMessage(message.from, 'Por favor, elige del *1 - 7* ');
                    conection.query(insertar2, [message.from, 'Por favor, elige del *1 - 7* ', message.body], (err)  =>{
                        if(err) throw err
                        console.log("Mensaje insertado correctamente en la tabla 'mensajeria'")
                    })
                    break;
            }
        }
        client.sendMessage(message.from, '¿Qué grupo muscular te gustaría trabajar?');
        client.sendMessage(message.from, '1. Pecho \n2. Espalda \n3. Hombros\n 4. Piernas\n 5. Bíceps\n 6. Tríceps\n 7. Abdominales');
        iniciarSwitch = true;
    }
});






client.initialize();



import { useEffect, useState } from "react";
// import { Route, Routes } from "react-router-dom";

const App = () => {
 
      const [frasesList, setFrasesList] = useState([]);

      useEffect(()=>{
        fetch('http://localhost:4000/frases/personajes/capitulos')
        .then(response => response.json())
        .then(data =>  setFrasesList(data.result))
        .catch((error) => console.log('error al traer frases: ', error));
     }, []);


console.log(frasesList)
  return (
    <>
      <h1>Frases de los Simpsons</h1>
       <ul className="list">
           { frasesList.length !== 0 ? frasesList.map(item => 
           <>
            <li key={item.frase_id} className="list__item">
              <p><strong>{item.frase}</strong></p>
              <p>{item.personaje} en el capítulo de "{item.capitulo}"</p>
            </li>
            </> 
            
           ) : <p>Not found</p> }
            
        </ul>


    </>
  );
};

export default App;

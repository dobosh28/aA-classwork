import coffeeBeans from "./mockData/coffeeBeans.json";
import SetCoffeeBean from "./components/SetCoffeeBean";
import SelectedCoffeeBean from "./components/SelectedCoffeeBean";

function App() {
  return (
    <>
      <h1>Welcome to Coffee App</h1>
      <SelectedCoffeeBean/>
      <SetCoffeeBean coffeeBeans={coffeeBeans}/>
    </>
  );
}

export default App;
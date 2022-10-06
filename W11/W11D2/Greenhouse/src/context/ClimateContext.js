// Temperature has a default value of 50 degrees
// Humidity has a default value of 40%

import { createContext, useContext, useState } from 'react';

export const ClimateContext = createContext();

export const useClimate = () => useContext(ClimateContext);

export default function ClimateProvider({ children }) {
  const [ climateTemp, setClimateTemp] = useState(50);
  const [ climateHum, setClimateHum] = useState(40);

  return (
    <ClimateContext.Provider
      value={{
        climateTemp,
        setClimateTemp,
        climateHum,
        setClimateHum
      }}
    >
      {children}
    </ClimateContext.Provider>
  );
}
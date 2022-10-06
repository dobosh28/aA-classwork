import './LightSwitch.css';
import { useThemeContext } from '../../context/ThemeContext';

function LightSwitch() {
  const { themeName, setThemeName } = useThemeContext();
  return (
    <div className={`light-switch ${themeName}`}>
      <div className="on" onClick={ (e) => handleClick(e)}>DAY</div>
      <div className="off" onClick={ (e) => handleClick(e)}>NIGHT</div>
    </div>
  );

  function handleClick(e) {
    if (e.target.className === "on") {
      setThemeName("day")
    } else {
      setThemeName("night")
    }
  }
}


export default LightSwitch;
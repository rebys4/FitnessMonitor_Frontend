import SignIn from './pages/Auth/Signin/SignIn';
import SignUp from './pages/Auth/SignUp/SignUp';
import ConfirmSignUp from './pages/Auth/SignUp/ConfirmSignUp'
import NavBar from './components/navbar/NavBar';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Main from './pages/Main/Main';
import GymZoneMap from './components/Rooms/gymZone';
import MenuRoom from './components/Rooms/MenuRoom';


function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<SignIn />} />
        <Route path="/signup" element={<SignUp />} />
        <Route path="/confirm" element={<ConfirmSignUp />} />
        <Route path="/main" element={<Main />} />
        <Route path="/gymzone" element={<GymZoneMap />} />
        <Route path='/menuroom' element={<MenuRoom />} />
      </Routes>
    </Router>
    
  );
}

export default App;
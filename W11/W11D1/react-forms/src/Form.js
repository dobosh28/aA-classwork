import { useState } from "react";

function Form() {
  const [name, setName] = useState("")
  const [email, setEmail] = useState("")
  const [number, setNumber] = useState("")
  const [type, setType] = useState("home")
  const [staff, setStaff] = useState("")
  const [bio, setBio] = useState("")

  const handleSubmit = e => {
    e.preventDefault()
    console.log(name, email, number, type, staff, bio)
  }

  return (
    <form onSubmit={handleSubmit}>
      <label>Name
        <input id="n" type="text" name="name" value={name} onChange={e => setName(e.target.value)} required></input>
      </label>

      <br></br>
      
      <label>Email
        <input id="e" type="email" name="email" value={email} onChange={e => setEmail(e.target.value)} required></input>
      </label>

      <br></br>

      <label>Phone number
        <input id="ph" type="number" name="phone number" value={number} onChange={e => setNumber(e.target.value)} required></input>
      </label>

      <br></br>

      <label>Phone type
        <select name="phone type" value={type} onChange={e => setType(e.target.value)} required>
          <option value="home">Home</option>
          <option value="work">Work</option>
          <option value="mobile">Mobile</option>
        </select>
      </label>

      <br></br>

      <label>Staff</label>
      <br></br>
      <label>Student</label>
      <input type="radio" name="staff" value={staff} onChange={e => setStaff("Student")} required></input>
      <label>Instructor</label>
      <input type="radio" name="staff" value={staff} onChange={e => setStaff("Instructor")} required></input>
  

      <br></br>

      <label>Bio
        <input type="text" value={bio} onChange={e => setBio(e.target.value)} required></input>
      </label>

      <br></br>

      <label>Sign up for email notifications
        <input type="checkbox" name="sign up"></input>
      </label>
      
      <br></br>

      
      <input type="submit"></input>
    
    </form>
  );
}

export default Form;

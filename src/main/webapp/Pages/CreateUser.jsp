<!DOCTYPE html>
<html>
  <head>
    <title>SaranWebApp - Create A New Account</title>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      html, body {
      min-height: 100%;
      }
      body, div, form, input, select, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 14px;
      color: #666;
      }
      h1 {
      margin: 0;
      font-weight: 400;
      }
      h3 {
      margin: 12px 0;
      color: #8ebf42;
      }
      .main-block {
      display: flex;
      justify-content: center;
      align-items: center;
      background: #fff;
      }
      form {
      width: 100%;
      padding: 20px;
      }
      fieldset {
      border: none;
      border-top: 1px solid #8ebf42;
      }
      .account-details, .personal-details {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      }
      .account-details >div, .personal-details >div >div {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
      }
      .account-details >div, .personal-details >div, input, label {
      width: 100%;
      }
      label {
      padding: 0 5px;
      text-align: right;
      vertical-align: middle;
      }
      input {
      padding: 5px;
      vertical-align: middle;
      }
      .checkbox {
      margin-bottom: 10px;
      }
      select, .children, .gender, .bdate-block {
      width: calc(100% + 26px);
      padding: 5px 0;
      }
      select {
      background: transparent;
      }
      .gender input {
      width: auto;
      } 
      .gender label {
      padding: 0 5px 0 0;
      } 
      .bdate-block {
      display: flex;
      justify-content: space-between;
      }
      .birthdate select.day {
      width: 35px;
      }
      .birthdate select.mounth {
      width: calc(100% - 94px);
      }
      .birthdate input {
      width: 38px;
      vertical-align: unset;
      }
      .checkbox input, .children input {
      width: auto;
      margin: -2px 10px 0 0;
      }
      .checkbox a {
      color: #8ebf42;
      }
      .checkbox a:hover {
      color: #82b534;
      }
      button {
      width: 100%;
      padding: 10px 0;
      margin: 10px auto;
      border-radius: 5px; 
      border: none;
      background: #8ebf42; 
      font-size: 14px;
      font-weight: 600;
      color: #fff;
      }
      button:hover {
      background: #82b534;
      }
      @media (min-width: 568px) {
      .account-details >div, .personal-details >div {
      width: 50%;
      }
      label {
      width: 40%;
      }
      input {
      width: 60%;
      }
      select, .children, .gender, .bdate-block {
      width: calc(60% + 16px);
      }
      }
      .modal {
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 1; /* Sit on top */
padding-top: 100px; /* Location of the box */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
background-color: #fefefe;
margin: auto;
padding: 20px;
border: 1px solid #888;
width: 40%;
top:50px;
}

/* The Close Button */
.close {
color: #aaaaaa;
float: right;
font-size: 28px;
font-weight: bold;
}

.close:hover,
.close:focus {
color: #000;
text-decoration: none;
cursor: pointer;
}
    </style>
    <script>
      
      function closeModal(){
          var modal = document.getElementById("myModal");
          modal.style.display = "none"
      }
      window.onclick = function(event) {
          var modal = document.getElementById("myModal");
      if (event.target == modal) {
          modal.style.display = "none";
      }
      }
      // function popup(Message){
      //     document.getElementById('pop').innerHTML=Message;
      //     document.getElementById("myModal").style.display = "block";
      // }
      function popup(){
          // document.getElementById('pop').innerHTML= 'Upload your profile picture';
          document.getElementById("myModal").style.display = "block";
      }
      function previewImage(){
        var file = document.getElementById('btnFile').files;
        if(file.length>0){
          var fileReader = new FileReader();
          fileReader.onload=function(event){
            document.getElementById('upload').setAttribute("src",event.target.result);
          };
          fileReader.readAsDataURL(file[0]);
        }
      }
      // function preview(){
      //   document.getElementById('icon').src = document.getElementById('upload').src;
      //   document.getElementById('icon').style.height="180px";
      //   document.getElementById('icon').style.width="140px";
      //   document.getElementById('icon').style.marginTop = "-209px";
      //   document.getElementById('icon').style.marginLeft="-5px";
      //   closeModal();
      // }
    </script>
  </head>
  <body>
    <div class="main-block">
    <form action="createUser" method="POST" enctype="multipart/form-data">
      <h1>Create a free account in <b><font color="#8ebf42">S</font>aranWebApp</b></h1>
      <div id="myModal" class="modal">
        <div class="modal-content">
          <span class="close" onclick="closeModal()">&times;</span>
          <div id="pop">
            
        </div>
        </div>
    </div> 
      <fieldset>
        <legend>
          <h3>Account Details</h3>
        </legend>
        <div  class="account-details">
          <div><label>Email*</label><input type="text" name="email1" ></div>
          <div><label>Password*</label><input type="password" name="pass1" ></div>
          <div><label>Repeat email*</label><input type="text" name="email2" ></div>
          <div><label>Repeat password*</label><input type="password" name="pass2" ></div>
        </div>
      </fieldset>
      <fieldset>
        <legend>
          <h3>Personal Details</h3>
        </legend>
        <div  class="personal-details">
          <div>
            <div><label>First Name</label><input type="text" name="fname" ></div>
            <div><label>Last Name</label><input type="text" name="lname" ></div>
            <div>
              <label>Gender*</label>
              <div class="gender">
                <input type="radio" value="0" id="male" name="gender" />
                <label for="male" class="radio">Male</label>
                <input type="radio" value="1" id="female" name="gender" />
                <label for="female" class="radio">Female</label>
              </div>
            </div>
            <div class="birthdate">
              <label>Birthdate*</label>
              <div class="bdate-block">
                <select class="day" name="date">
                  <option value=""></option>
                  <option value="01">01</option>
                  <option value="02">02</option>
                  <option value="03">03</option>
                  <option value="04">04</option>
                  <option value="05">05</option>
                  <option value="06">06</option>
                  <option value="07">07</option>
                  <option value="08">08</option>
                  <option value="09">09</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                </select>
                <select class="mounth" name="month" >
                  <option value=""></option>
                  <option value="January">January</option>
                  <option value="February">February</option>
                  <option value="March">March</option>
                  <option value="April">April</option>
                  <option value="May">May</option>
                  <option value="June">June</option>
                  <option value="July">July</option>
                  <option value="August">August</option>
                  <option value="September">September</option>
                  <option value="October">October</option>
                  <option value="November">November</option>
                  <option value="December">December</option>
                </select>
                <input type="text" name="year" >
              </div>
            </div>
            <div><label>Phone Number</label><input type="text" name="phone" ></div>
          </div>
          <div>
            <div><label>Door Number</label><input type="text" name="dno"></div>
            <div><label>Address Line 1</label><input type="text" name="l1" ></div>
            <div><label>Address Line 2</label><input type="text" name="l2" ></div>
            <div><label>Address Line 3</label><input type="text" name="l3" ></div>
            <div><label>PINCODE</label><input type="text" name="pin"></div>
            
          </div>
        </div>
      </fieldset>
      <!-- <button onclick="popup('Hello World')">Click to upload Profile Picture</button> -->
      <div style="position: absolute;
      margin-top: -225px;
      margin-left: 1px;
      height: 200px;
      width: 150px;">
        <center>
          <img id ="upload" width="140px" height="180px"/><hr>
          <input name="uploadFile" id="btnFile" type="file" accept="image/*" onchange="previewImage()"/>
          <!-- <button onclick="preview()">Confirm Picture</button> -->
        </center>
      </div>
      <!-- <img id="icon" style="position:absolute;margin-top:-150px;margin-left:40px;height:70px" src="Images/Upload.png" onclick="popup()"/> -->
      <br><br>
      <!-- <button>Create User without Profile Picture (for now)</button> -->
      <button type="submit">Submit</button>
    </form>
    </div> 
  </body>
</html>
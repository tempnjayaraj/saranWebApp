<!DOCTYPE html>
<html>
  <head>
    <title>SaranWebApp - Create A New Account</title>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      [type=radio] { 
  position: absolute;
  opacity: 0;
  width: 0;
  height: 0;
}

/* IMAGE STYLES */
[type=radio] + img {
  cursor: pointer;
}

/* CHECKED STYLES */
[type=radio]:checked + img {
  outline: 2px solid #f00;
}
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
#proPic{
  position: relative;
  margin-left: 75%;
  width: 210px;
  height: 270px;
  border-radius: 500px
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
      function popup(){
          document.getElementById("myModal").style.display = "block";
      }
      function previewImage(){
        var file = document.getElementById('btnFile').files;
        if(file.length>0){
          var fileReader = new FileReader();
          fileReader.onload=function(event){
            document.getElementById('_upload').setAttribute("src",event.target.result);
          };
          fileReader.readAsDataURL(file[0]);
        }
      }
      function now(){
        // window.location.reload();
        const date = new Date();
        let time = date.getHours();
        if(time>6&&time<=11){
          // document.getElementById('welcome').style.fontWeight="400";
          document.getElementById('welcome').innerHTML="Good Morning,";
        }else if(time>11&&time<=15){
          document.getElementById('welcome').innerHTML="Good Afternoon,";
          // document.getElementById('welcome').style.fontWeight="400";
        }else if(time>15&&time<=19){
          document.getElementById('welcome').innerHTML="Good Evening,";
          // document.getElementById('welcome').style.fontWeight="400";
        } else if(time>19){
          document.getElementById('welcome').innerHTML="Good Night,";
          // document.getElementById('welcome').style.fontWeight="400";
        }else{
          document.getElementById('welcome').innerHTML="Good Dawn,";
          // document.getElementById('welcome').style.fontWeight="400";
        }
      }
    </script>
  </head>
  <body onload="now()">
    <%@ page import="java.io.*,java.util.*"%>
    <div class="main-block">
      <h1 id="welcome"></h1><span><b><font style="font-size: 35px;" color="#8ebf42">${username}</font></b></span>
    </div> 
    <div id="proPic" onclick="popup()">
      <img id ="upload" width="140px" height="180px" src='${filePath}'/>
    </div>
    <div id="myModal" class="modal">
      <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <div id="pop">
          <!-- Currently Active
          <img id ="upload" width="140px" height="180px" src='${filePath}'/> -->
          
      <hr>
      
      <% 
      String userID = (String)request.getAttribute("userID");
      List<String> imgList = (List)request.getAttribute("imgList");
        out.print("<form action='change' method='POST' enctype='multipart/form-data'>");
      for(int i=0;i<imgList.size();i++){
        String input = "<input type='radio' name='avail' value='img"+i+"'>";
        String image = "<img height = '100px' src='"+imgList.get(i).replace("C:/Users/johns/Desktop/Images", "http://127.0.0.1:8887") +"'/>";  
        
        out.print("<label>");
        out.print(input);
        out.print(image);
        out.print("</label>"); 
      }
      out.print("<input type='submit' value='Change'/>");
      out.print("</form>");
      %>
      <hr>
      
      <form style="display:inline ;"  action="upload" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="userID" id="userID" value="<%=userID%>"></input>
        <input name="uploadFile" id="btnFile" type="file" accept="image/*" onchange="previewImage()"/>
        <input type="submit" value="Upload New Image"/>
        <img style="display:inline ;" height="35px" src="Images/img.jpg"/>
      </form>

      <form style="display:inline ;"  action="upload" method="DELETE">
        <img style="display:inline ;" height="20px" src="Images/remove.png">
      </form>

      
      <img id="_upload" style="display:inline ;" height="100px" src="Images/upload.jpg">
      </div>
      </div>
  </div> 
  </body>
</html>
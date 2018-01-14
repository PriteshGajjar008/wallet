<HTML>
 <body>
 	<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	  <script type="text/javascript">
 	  	function verifyConfirmPwd() {
 	  		var pwd = $('#regPwd').val();
			var cPwd = $('#confPwd').val();
			enableRegisterBtn((pwd == cPwd));
			if(!(pwd == cPwd)) { 
				$('#confError').css('display','inline');
			} else {
				$('#confError').css('display','none');
			}
 	  	}
 	  	function enableRegisterBtn(flag) {
 	  		if(flag) {
 	  			$('#registerBtn').removeAttr('disabled');
 	  		} else {
 	  			$('#registerBtn').attr('disabled','disabled');
 	  		}
 	  	}
 	  	function checkUser() {
 	  		var userName = $('#user').val();
 	  		$.ajax({
 	  		  url: "./check-user?USER="+userName,
 	  		}).done(function( res ) {
 	  		    if(res == "true") {
 	  		    	$('#userStatus').css('color','red');
 	  		    	  $('#userStatus').html("Not available");
 	  		    	   enableRegisterBtn(false)
 	  		    } else {
 	  		    	  $('#userStatus').css('color','green');
	  		    	  $('#userStatus').html("Available");
	  		    	  enableRegisterBtn(true);
 	  		    }
 	  		  });
 	  	}
 	  </script>
 	  <style type="text/css">
 	  	span { font-size: 0.8em;}
 	  	table {   
 	  		border-spacing: 20px;
 	  	}
 	  	#confError {
 	  	 color : red;
 	  	 font-size:0.5em;
 	  	 display:none;	
 	  	}
 	  	.loginError {  color:red;}
 	  	input {
 	  		height: 50px;
 	  		width:300px;
 	  		font-size:1em;
 	  	}
 	    .loginDiv {  
 	    	    border: 1px solid black;
 	    		margin:-200px 0 0 -250px;
		    position:absolute;
		    left:50%;
		    top:50%;
 	    }
 	    .registerDiv {
 	    		height: 100%;
 	    		float:right;
 	    		width:500px;
 	    		background-color: #E3E5DD;
 	    }
 	    .registerDiv input { display: block;}
 	    td { font-size: 2em;}
 	    .center { text-align: center;}
 	  	button { 
 	  	  border-radius: 5px;
    		  border: 1px solid green;
  		  font-family: monospace;
  		  font-size: 1.5em;
 	  	}
 	  </style>
 	</head>
 	<form method="POST" action="./validate">
 	<div class='loginDiv'>
 	 <table>
 	 	<tr>
 	 	 <td >
 	 	 	User Name
 	 	 </td> 
 	 	 <td>
 	 	   <input type='text' name='user' autofocus/>
 	 	 </td>
 	 	</tr>
 	 	<tr>
 	 	 <td>
 	 	 	Password
 	 	 </td> 
 	 	 <td>
 	 	   <input type='password' name='pwd'/>
 	 	 </td>
 	 	</tr>
 	 	<tr >
 	 		<td class='center' colspan="2"><button type='submit'>Login</button></td>
 	 	</tr>
 	 	<tr>
 	 	<%
			if(request.getParameter("validate") != null) {
		%>
 	 		<td class='loginError' colspan="2"> Invalid user name or password </td>
 	 	<% 
			}
		%>
 	 	</tr>
 	 </table>
 	</div>
 	</form>
 	<form action="./register" method="POST">
 		<div class='registerDiv'>
 		  <h1> Register Here ...</h1>
 		  <table>
 		   <tr>
 		    <td>
 		    	 First Name 
 		    	 <input type='text' name='firstName' required/>
 		    </td>
 		   </tr>
 		  
 		   <tr>
 		    <td>
 		    	 Email ID 
 		    	 <input type='email' name='email' autocomplete="on"
 		    	 	required/>
 		    </td>
 		   </tr>
    		   <tr>
    		    	<td>Mobile Number
    		    	    		    	 <input type="tel" name='phone' required/>
    		    	
    		    	</td>
    		   </tr>
    		   <tr>
 		    <td>
 		    <span  style="display:block;font-size:1em">User Name</span>
 		    <input type='text' style="display:inline" id='user' name='user' onchange='checkUser()' required/>
 		    <span id='userStatus'></span>
 		    </td>
    		   </tr>
    		   <tr>
    	 		 <td>Password
    	 		 <input type='password' id='regPwd' name='pwd' required/>
    	 		 </td>
    		   </tr>
    		   <tr>
    	 		 <td>Confirm Password
    	 		 <input type='password' id='confPwd' name='confirmPwd' required 
    	 		 		onchange="verifyConfirmPwd()"/>
    	 		 <span id='confError'>Password doesn't match</span>
    	 		 </td>
    		   </tr>
    		   
    		   <tr>
    		   	<td><button id='registerBtn' type='submit'>Register</button>
    		   </tr>
 		  </table>
 		</div>
 	</form>
 </body>
</HTML>















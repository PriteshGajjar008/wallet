<%@page import="com.pga.wallet.*" %>
<%
   if(session.getAttribute("USER") == null) {
		response.sendRedirect("home.jsp");
   }
	float bal = 0;
	String userName = "";
    User user = (User)session.getAttribute("USER");
    if(user!=null) {
   	userName = user.getUser();
   	bal = AccountDao.getBalance(userName);
    }
%>
<% if(user!=null)  { %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$('document').ready(function() {
		$('#addToWallet').click(addToWallet);
		$('#logout').click(logout);
		$('.amount').click(function() {
			enableBtn();
			var amt = $(this).text();
			$('#amt').val(amt);
		});
	});

	function logout() {
		window.location="./logout.jsp";
	}
	function enableBtn() {
		$('#addToWallet').removeAttr('disabled');
	}
	function addToWallet() {
		var amt = $('#amt').val();
 		$.ajax({
 			  method: "POST",
	  		  url: "./add-to-wallet?amt="+amt,
	  	}).done(function( res ) {
	  		$('#balacne').html(res);
	  	});
	}
</script>
<style type="text/css">
  div {
  	font-size : 1.5em;
  	margin-bottom: 10px;
  }
  #addToWallet { 
  	width: 400px;
  	height: 80px;
  	background-color: A7F187;
  	font-weight: bolder;
  	font-size: 2em;
  }
  button { 
  	font-size: 1em; border: 1px solid black; 
 	border-radius:10px;
 	background-color: 01C5FF;
 	margin-right: 50px;
 }
  input { height: 50px; width:200px; font-size: 1em;}
  .main {
  	margin : 50px;
  }
</style>

<div class='main'>
  <div> Your current balance is <span id='balacne'><%=bal%></span></div>
  <div style="float:right">
  	<button id='logout'> Logout </button>
  </div>
  <div> Enter Amount 
  		<input type='number' id='amt' name='amt' oninput='enableBtn()'/>
  </div>
  
  <div> 
  	<button class='amount'>200</button>
  	<button class='amount'>500</button>
  	<button class='amount'>1000</button>
  </div>
  <button id='addToWallet' disabled>Add To Wallet</button>
</div>
<%} %>






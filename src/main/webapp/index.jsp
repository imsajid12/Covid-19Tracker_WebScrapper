<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.utilities.GetConnection" %>
<%@page errorPage="error_exception.jsp" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="shortcut icon" type="image/png" href="img/favicon.ico"/>
	
	<link href="https://fonts.googleapis.com/css2?family=Lato:ital@1&display=swap" rel="stylesheet">
	
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Coronavirus Countrywise Tracker</title>
    <style>
    	body {
    		font-family: 'Lato', sans-serif;
    	}
    	
    	/*#results {
    		display:none;
    	}*/
    	
    	.no-border {
    		border: 0;
    	}
    	
    	.country-name {
    		text-transform: capitalize;
    	}
    	
    	.alert {
    		display: none;
    	}
    	
    	#main-footer a {
    	//text-decoration: none;
    	color: white;
    }
    </style>
</head>

<body class="bg-secondary">
	<%
		//fetching values
		ArrayList<String> list = (ArrayList<String>)request.getAttribute("dataList");
		String totalCases, deaths, recovered, imgSrc, countryName;
		if(list != null) {
			totalCases = list.get(0);
			deaths = list.get(1);
			recovered = list.get(2);
			countryName = request.getParameter("tbSearchCountry");
			//imgSrc = list.get(3);
		} else {
			ArrayList<String> worldWideList = (ArrayList<String>)GetConnection.getData();
			totalCases = worldWideList.get(0);
			deaths = worldWideList.get(1);
			recovered = worldWideList.get(2);
			countryName = "Worldwide Cases";
			//imgSrc = "";
		}
		
		
		
	%>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card card-body text-center mt-5">
                    <h1 class="heading pb-3">Coronavirus Tracker</h1>
                    <form action="Servlet1" id="search-form">
                        <div class="form-group">
                            <input type="text" class="form-control" name="tbSearchCountry" id="search-country"
                                placeholder="Enter country name" >
                             <span class="alert text-danger text-left"></span>
                        </div>
                        
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-block" value="Search" name="btnSearch"
                                id="search-btn">
                        </div>
                    </form>

                    <!-- Results -->
                    <div id="results" class="pt-3">
                    	<div class="mb-3">
                    	<%-- <img class="mr-3" alt="flag icon" src= <%= imgSrc %>> --%>
                    	<h3 style="display:inline" class="text-primary country-name"><%= countryName %></h3>
                    	</div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-warning">Total Corona Cases :</span>
                                    <input type="text" class="form-control bg-white no-border" name="tbTotalCoronaCases"
                                        id="total-corona-cases" disabled value= <%= totalCases %>>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-danger">Deaths :</span>
                                    <input type="text" class="form-control bg-white no-border" name="tbDeaths" id="deaths" disabled value= <%= deaths %>>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-success">Recovered :</span>
                                    <input type="text" class="form-control bg-white no-border" name="tbRecovered" id="recovered" disabled value= <%= recovered %>>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    
    <footer id="main-footer" class="pt-2 bg-dark text-danger mt-4">
    	<div class="container">
    		<div class="row text-center">
    			<div class="col-md-6 mx-auto">
    			<i class="fab fa-instagram"></i>
    				<p class="lead">
    					<a href="https://www.instagram.com/allkonnected/" target="_blank">@allkonnected</a>
    				</p>
    			</div>
    		</div>
    	</div>
    </footer>

    <!-- Active & closed card-->
    <!-- <div class="row">
        <div class="col-md-6 mt-5">
            <div class="card card-body">
                <h1 class="heading text-center">Active Cases</h1>
                <div class="text-center">
                    <h3>Infected</h3>
                    <h5 class="text-danger">45</h5>
                </div>
                <div class="text-left col-md-3">
                    <h3>Mild</h3>
                    <h5 class="text-danger">45</h5>
                </div>
                <div class="text-right">
                    <h3>Critical</h3>
                    <h5 class="text-danger">45</h5>
                </div>
            </div>
        </div>
    </div>
-->
    <!-- <footer id="sticky-footer" class="py-4 bg-primary text-white-50 mt-7">
        <div class="container-fluid text-center">
            <small>Copyright &copy; Your Website</small>
        </div>
    -->
    </footer>
    <!-- Optional JavaScript -->
    <script src="https://kit.fontawesome.com/214af2bfef.js" crossorigin="anonymous"></script>
    <script>
    	//console.log("hello");
    	
    	document.getElementById('search-form').addEventListener('submit',function(e) {
    		const countryName = document.getElementById('search-country').value;
    		
    		if(countryName === '' || countryName === null) {
    			showAlert("Please enter a country name");
    			e.preventDefault();
    		}
    		if(hasNumber(countryName) === true) {
    			showAlert("Numbers are not allowed, Please enter a vaild country name or abbrevation");
    			e.preventDefault(); 
    		}
    		/* e.preventDefault();  */
    	}); 
    	
    	function hasNumber(myString) {
    		  return /\d/.test(myString);
    		}
    	
    	function showAlert(msg) {
    		document.querySelector(".alert").style.display ="block";
    		document.querySelector(".alert").innerHTML = msg;

			//remove after 2 sec
			setTimeout(function () {
		        document.querySelector('.alert').style.display ="none";
		    }, 2000);
			
			document.querySelector("#search-country").focus();
    	}
    </script>
 
    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src=" https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
        </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

</html>
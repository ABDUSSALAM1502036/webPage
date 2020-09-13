<!DOCTYPE html>
<html lang="en"><!-- Basic -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Live Dinner Restaurant - Responsive HTML5 Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->

    <asset:link rel="shortcut icon" href="favicon.ico" type="x-icon"/>
    <asset:link rel="apple-touch-icon" href="apple-touch-icon.png"/>

    <!-- Bootstrap CSS -->
    <asset:stylesheet href="bootstrap.min.css"/>
    <!-- Site CSS -->
    <asset:stylesheet href="style.css"/>
    <!-- Responsive CSS -->
    <asset:stylesheet href="responsive.css"/>
    <!-- Custom CSS -->
    <asset:stylesheet href="custom.css"/>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        #create-student1{
            text-align:center;
            width:350px;
            height:470px;
            padding:20px;
            margin:20px;
            float:left;
            border: 2px red solid;
        }
        #create-student2{
            text:center;
            width:500px;
            height:470px;
            padding:20px;
            margin:20px;
            float:left;
            border: 2px red solid;
        }
         #create-student3{
            margin-top:100px;
            text-align:center;
            width:350px;
            height:470px;
            padding:20px;
            margin:20px;
            float:left;
            border: 2px red solid;
        }
        #create-student4{
            margin-top:100px;
            text-align:center;
            width:350px;
            height:470px;
            padding:20px;
            margin:20px;
            float:left;
            border: 2px red solid;
        }
        #create-student2 input,textarea{
            margin:5px;
        }
        #create-student3 input,button{
            margin:10px;
            width:250px;
        }
        
    </style>

</head>

<body>
<!-- Start header -->
<header class="top-navbar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.html">
                <asset:image src="logo.png" alt="" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbars-rs-food">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="menu.html">Menu</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown-a">
                            <a class="dropdown-item" href="reservation.html">Reservation</a>
                            <a class="dropdown-item" href="stuff.html">Stuff</a>
                            <a class="dropdown-item" href="gallery.html">Gallery</a>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="blog.html">blog</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                    <li class="nav-item active"><a class="nav-link" href="admin.html">Admin</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- End header -->
<div>
    <br><br><br><br>
</div>
<!--start developer form -->
        <div id="create-student1">
            <br><br><br>
            <h3>Add Developer Details Here...</h3><br>
            <g:form resource="${this.webPage}" method="POST">
                <fieldset class="form">
                    <f:all bean="webPage"/>
                </fieldset><br>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Create" />
                </fieldset>
            </g:form>
        </div>
<!--end developer form-->

<!--start Blog form-->
    <div id="create-student2">
        <strong style="margin:5px">Add Post Here...</strong><br>
        <input type="text" id="title" placeholder="Enter Post Title"/> 
        <input type="text" id="catagory" placeholder="Enter catagory"/> <br>
        <textarea cols="50" rows="5" id="post_shortcut" placeholder="Enter post-shortcut"></textarea><br>
        <textarea cols="50" rows="5" id="post_details" placeholder="Enter post-details"></textarea><br>
        <button style="width:100px;margin-left:320px" id = "button1" name = "button1" onClick = "postAjax()">post</button>
    </div>
<!--end Blog form-->
<!--start Stuff form-->
    <div id="create-student3" >
        <div style="margin-top:90px">
            <strong >Add Stuff details Here...</strong><br>
            <g:uploadForm class="photos" action ="stuff_ajax_req">
                <g:field type="text" name="stuff_name" placeholder="Enter Stuff Name "/><br>
                <g:field type="text" name="stuff_position" placeholder="Enter Stuff Position "/><br>
                <g:field name="photo" type="file" accept="image/*"/>
                <g:submitButton name="save" value="save" />
            </g:uploadForm>
        </div>
    </div>
<!--end Stuff form-->
<!--start Menu form-->
    <div id="create-student4" >
        <div style="margin-top:30px">
            <h2 >Add Menu Items Here...</h2><br>
            <div class="col-md-12">
				<div class="form-group">
					<select class="custom-select d-block form-control" id="guest" required data-error="Please Select Person">
						<option disabled selected>Select Category*</option>
						<option value="drinks">drinks</option>
						<option value="breakfast">breakfast</option>
						<option value="lunch">lunch</option>
						<option value="dinner">dinner</option>
					</select>
					<div class="help-block with-errors"></div>
				</div> 
			</div>
            <div class="col-md-12">
				<div class="form-group">
					<input  class="custom-select d-block form-control" type="text" id="menu_title" placeholder="Enter Menu Title"/>
				</div> 
                <div class="form-group">
					<input  class="custom-select d-block form-control" type="text" id="menu_price" placeholder="Enter Menu Price"/> 
				</div> 
                <div class="form-group">
					 <input   class="custom-select d-block form-control" type="text" id="menu_details" placeholder="Enter Menu Details"/>
				</div> 
			</div> 
            <button onClick="menuClass()" style="width:100px;" id = "button3" name = "button3">save</button>
        </div>
    </div>
<!--end Menu form-->

<!--start Home_image form-->
    <div id="create-student3" >
        <div style="margin-top:115px">
            <h3 >Add Welcome_Image Here...</h3><br>
            <g:uploadForm class="photos" action ="create">
                <g:field type="text" name="category" value="home"/><br>
                <g:field name="photos" type="file" accept="image/*"/>
                <g:submitButton name="upload" value="Upload" />
            </g:uploadForm>
        </div>
    </div>
<!--end Home_image form-->

<!--start Gallery_image form-->
    <div id="create-student3" >
        <div style="margin-top:115px">
            <h3 >Add Gallery_image Here...</h3><br>
            <g:uploadForm class="photos" action ="create1">
                <g:field type="text" name="category" value="gallery"/><br>
                <g:field name="photos" type="file" accept="image/*"/>
                <g:submitButton name="upload" value="Upload" />
            </g:uploadForm>
        </div>
    </div>
<!--end Gallery_image form-->


<a href="#" id="back-to-top" title="Back to top" style="display: none;"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>

<!-- ALL JS FILES -->
<asset:javascript src="jquery-3.2.1.min.js"></asset:javascript>
<asset:javascript src="popper.min.js"></asset:javascript>
<asset:javascript src="bootstrap.min.js"></asset:javascript>
<!-- ALL PLUGINS -->
<asset:javascript src="jquery.superslides.min.js"></asset:javascript>
<asset:javascript src="images-loded.min.js"></asset:javascript>
<asset:javascript src="isotope.min.js"></asset:javascript>
<asset:javascript src="baguetteBox.min.js"></asset:javascript>
<asset:javascript src="form-validator.min.js"></asset:javascript>
<asset:javascript src="contact-form-script.js"></asset:javascript>
<asset:javascript src="custom.js"></asset:javascript>
</body>
<script>
        function menuClass() {
            $(document).ready(function() {
                var menu_catagory = $('#guest').val();
                var menu_title = $('#menu_title').val();
                var menu_price = $('#menu_price').val();
                var menu_details = $('#menu_details').val();

                
                if(menu_catagory == "" || menu_title == "" || menu_price == "" || menu_details == ""){
                    alert('***please fillup all fields !!');
                    return false;
                }

                //alert(menu_catagory+" " + menu_title + "  " + menu_price + " " + menu_details);
                var URL="${createLink(controller:'webPage',action:'menu_ajax_req')}"

                $.ajax({
                    url: URL,
                    type: "POST",
                    datatype: "html",
                    data:{catagory:menu_catagory,title:menu_title,item_details:menu_details,price:menu_price},
                    success:function(data)
                    {
                        alert(data);
                        $('#menu_catagory').val("");$('#menu_title').val("");
                        $('#menu_details').val("");$('#menu_price').val("");
                    }
                })
            })
        }
        function postAjax() {
            $(document).ready(function() {
                const monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];
                var title = $('#title').val(); 
                var catagory = $('#catagory').val();
                var today = new Date();
                var date = today.getDate()+' '+ monthNames[today.getMonth()]+', '+(today.getFullYear()+1);
                var today1 = new Date();
                var time = today1.getHours() + ":" + today1.getMinutes(); 
                var post_shortcut = $('#post_shortcut').val(); 
                var post_details = $('#post_details').val(); 

                if(title == "" || date == "" || time == "" || post_shortcut == "" || post_details == "" || catagory == "") {
                    alert('***please fillup all fields !!');
                    return false;
                }

                var URL="${createLink(controller:'webPage',action:'post_student_ajax_req')}"

                $.ajax({
                    url: URL,
                    type: "POST",
                    datatype: "html",
                    data:{title:title,date:date,time:time,post_shortcut:post_shortcut,post_details:post_details,catagory:catagory},
                    success:function(data)
                    {
                        alert(data);
                        $('#title').val("");$('#catagory').val("");
                        $('#post_shortcut').val("");$('#post_details').val("");
                    }
                })
            })
        }
    
    </script>
</html>

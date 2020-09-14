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
    <!-- Admin CSS-->
    <asset:stylesheet href="admin.css"/>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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

<div class="nav">
    <button><h2>add Developer</h2></button>
    <button><h2>add Blog</h2></button>
    <button><h2>add Stuff</h2></button>
    <button><h2>add Menu</h2></button>
    <button><h2>add Image</h2></button>
</div>

<!--start developer form -->
        <div id="create-student1" style="display:none">
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
    <div id="create-student2" style="display:none">
        <strong style="margin:5px">Add Post Here...</strong><br>
            <g:uploadForm class="photos" action ="blog_ajax_req">
            <input type="text" name="title" placeholder="Enter Post Title"/> 
            <select  id="menu_select" name="category">
                <option disabled selected>Select Category*</option>
                <option value="drink">drink</option>
                <option value="lunch">lunch</option>
                <option value="dinner">dinner</option>
            </select> <br>
            <textarea cols="50" rows="5" name="shortcut" placeholder="Enter post-shortcut" ></textarea><br>
            <textarea cols="50" rows="5" name="details" placeholder="Enter post-details"></textarea><br>
            <g:field name="photos" type="file" accept="image/*"/>
            <g:submitButton name="save" value="save" />
        </g:uploadForm>
    </div>
<!--end Blog form-->
<!--start Stuff form-->
    <div id="create-student3" style="display:none" >
        <div style="margin-top:90px">
            <strong >Add Stuff details Here...</strong><br>
            <g:uploadForm class="photos" action ="stuff_ajax_req">
                <g:field type="text" name="stuff_name" placeholder="Enter Stuff Name "/><br>
                <g:field type="text" name="stuff_position" placeholder="Enter Stuff Position "/><br>
                <g:field name="photos" type="file" accept="image/*"/>
                <g:submitButton name="save" value="save" />
            </g:uploadForm>
        </div>
    </div>
<!--end Stuff form-->
<!--start Menu form-->
    <div id="create-student4" style="display:none">
        <div style="margin-top:15px">
            <h2 >Add Menu Items Here...</h2><br>
            <g:uploadForm class="photos" action ="menu_ajax_req">
                <div class="col-md-12">
                    <div class="form-group">
                        <select class="custom-select d-block form-control" name="menu_guest" required data-error="Please Select Person">
                            <option disabled selected>Select Category*</option>
                            <option value="drinks">drinks</option>
                            <option value="lunch">lunch</option>
                            <option value="dinner">dinner</option>
                        </select>
                    </div> 
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <input  class="custom-select d-block form-control" name="menu_title" type="text" placeholder="Enter Menu Title"/>
                    </div> 
                    <div class="form-group">
                        <input  class="custom-select d-block form-control" name="menu_price" type="text" placeholder="Enter Menu Price"/> 
                    </div> 
                    <div class="form-group">
                        <input   class="custom-select d-block form-control" name="menu_details" type="text" placeholder="Enter Menu Details"/>
                    </div> 
                </div> 
                <div class="col-md-12">
                     <g:field name="photos" type="file" accept="image/*"/>
                    <g:submitButton name="save" value="save" style="width:100px;margin-left:170px;margin-top:10px"/> 
                </div> 
            </g:uploadForm>
        </div>
    </div>
<!--end Menu form-->

<!--start image form-->
    <div id="create-student5" style="display:none">
        <div style="margin-top:90px">
            <h2 >Add image Here...</h2>
            <g:uploadForm class="photos" action ="create1">
                <select id="image_category" name="category" >
						<option disabled selected>Select Category*</option>
                        <option value="home">home</option>
						<option value="gallery">gallery</option>
				</select>
                <g:field name="photos" type="file" accept="image/*"/>
                <g:submitButton name="upload" value="Upload" />
            </g:uploadForm>
        </div>
    </div>
<!--end image form-->


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
        $(document).ready(function(){
            $('.nav h2').click(function(){
                var item = $(this).html();
                if(item == "add Developer"){
                    $('#create-student1').css("display","block");
                    $('#create-student2').css("display","none");
                    $('#create-student3').css("display","none");
                    $('#create-student4').css("display","none");
                    $('#create-student5').css("display","none");
                }
                if(item == "add Blog"){
                    $('#create-student1').css("display","none");
                    $('#create-student2').css("display","block");
                    $('#create-student3').css("display","none");
                    $('#create-student4').css("display","none");
                    $('#create-student5').css("display","none");
                }
                if(item == "add Stuff"){
                    $('#create-student1').css("display","none");
                    $('#create-student2').css("display","none");
                    $('#create-student3').css("display","block");
                    $('#create-student4').css("display","none");
                    $('#create-student5').css("display","none");
                }
                if(item == "add Menu"){
                    $('#create-student1').css("display","none");
                    $('#create-student2').css("display","none");
                    $('#create-student3').css("display","none");
                    $('#create-student4').css("display","block");
                    $('#create-student5').css("display","none");
                }
                if(item == "add Image"){
                    $('#create-student1').css("display","none");
                    $('#create-student2').css("display","none");
                    $('#create-student3').css("display","none");
                    $('#create-student4').css("display","none");
                    $('#create-student5').css("display","block");
                }
            });
        });
    </script>
</html>

package webpage

class WebPageController {

    def ppost_id;

    def index() { 
        def all_menu = Items.list()
        def fetched_value = WebPage.list()
        def gallery_images = Gallery.findAll()
        def welcome_images = Image.findAll()
        [fetched_value:fetched_value,all_menu:all_menu,welcome_images:welcome_images,gallery_images:gallery_images]
    }

    def create1 () {
        def imageMap = [:];
        byte[] photo=request.getFile("photos").bytes
        String type = request.getFile("photos").contentType
        if (photo == null ) {
            imageMap.put("image", null);
            imageMap.put("imageContentType", null);
        } else {
            imageMap.put("image", photo);
            imageMap.put("imageContentType", type);
        }

        Gallery newImage = new Gallery(imageMap);
        if(newImage.save()){
            redirect action:"admin"
        }else{
            render "Error..!!"
        }
    }
    def getImage1(Long id) {
        def user = Gallery.get(id);
        if (user != null) {
            response.contentType = user.imageContentType == null ? "image/jpeg" : user.imageContentType;
            response.contentLength = user.image == null ? 0 : user.image.size();
            response.outputStream << user.image;
        } else {
            response.contentType = "image/jpeg";
            response.contentLength = 0;
            response.outputStream << null;
        }
    }
    
    def Menu() {
        def all_menu = Items.list()
        def fetched_value = WebPage.list()
        [fetched_value:fetched_value,all_menu:all_menu]
     }
    def menu_ajax_req(){
        Items newItem = new Items(params)
        def valu1 = params.catagory + params.title;
        if(newItem.save()){
            render "Item saved successfully"
        }else{
            render "${valu1}"
        }
    }
    def about() { 
        def all_menu = Items.list()
        [all_menu:all_menu]
    }
    def contact() { }
    def blog() {
        def fetched_value1 = Blogs.list() 
        [fetched_value1:fetched_value1]
     }
    def blog_details() { 
        def fetched_value1 = Blogs.findAll([sort: "date", order: "desc"]) 
        def catagory = Blogs.findAllByCatagoryIlike("%$params.catagory%")?.collect{it.catagory}
        def unique_catagory = catagory as Set

        ppost_id = params.post_id
        def postt_details = Blogs.findAllById(ppost_id)

        Blogs blogsObj = Blogs.get(postt_details.id)     
        def post_comments = Comment.findAllByBlogsInComment(blogsObj)

        [postt_details:postt_details, fetched_value1:fetched_value1,post_comments:post_comments,unique_catagory:unique_catagory]

    }
    /*def tag_Ajax_req(){
        def tag_info = params.tag;
        fetched_value1 = Blogs.findAllByCatagory(tag_info)
        [fetched_value1:fetched_value1]
    }*/

    def reservation() { 
        def fetched_value = WebPage.list()
        [fetched_value:fetched_value]
    }
    def send() {
        sendMail {
            to params.email
            subject "Live Dinner Reservation"
            text "Dear Sir\nYour Reservation at Live Dinner Restaurant has been confirmed\n\n\nName : " + params.name +"\nPhone Number : "+params.phone+"\nNo. of Persion:"+params.person+"\nDate:"+params.date+"\nTime:"+params.time+"Thanks for your reservation"
        }

        render "Reservation Confirmed...";
    }
    def stuff() {
        def fetched_value = WebPage.list()
        def stuffs_details = Member.findAll()
        [fetched_value:fetched_value,stuffs_details:stuffs_details]
    }
    def stuff_ajax_req(){
        def imageMap = [:];
        byte[] photo = request.getFile("photo").bytes
        String type  = request.getFile("photo").contentType
        String stuff_name = params.stuff_name;
        String position = params.stuff_position;
        if (photo == null ) {
            imageMap.put("stuff_name", null);
            imageMap.put("position", null);
            imageMap.put("stuff_image", null);
            imageMap.put("stuff_imageContentType", null);
        } else {
            imageMap.put("stuff_name", stuff_name);
            imageMap.put("position", position);
            imageMap.put("stuff_image", photo);
            imageMap.put("stuff_imageContentType", type);
        }

        Member newStuff = new Member(imageMap);
        if(newStuff.save()){
            redirect action:"admin"
        }else{
            render "Error..!!"
        }
    }
    def gallery() {
        def fetched_value = WebPage.list()
        def gallery_images = Gallery.findAll()
        [fetched_value:fetched_value,gallery_images:gallery_images]
    }
    def admin(){
        respond new WebPage(params)
    }
    def save(WebPage webPage) {
        webPage.save();
        redirect action:"admin", method:"GET"
    }
    def post_student_ajax_req(){
        Blogs newPost = new Blogs(params)
        newPost.save()
        render "Post saved successfully"
    }

    def comment_student_ajax_req(){
        def username = params.username
        def email = params.email
        def comment = params.comment
        def time = params.time

        def blogsFetch = Blogs.findAllById(ppost_id)
        Blogs blogsObj = Blogs.get(blogsFetch.id)

        Comment newCmt = new Comment(blogsInComment:blogsObj,username:username,email:email,time:time,post_comment:comment)
        newCmt.save()
        render "Comment saved successfully"
    }
    
}

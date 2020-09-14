package webpage

class WebPageController {

    def ppost_id;

    def index() { 
        def all_menu = Items.list()
        def fetched_value = WebPage.list()
        def gallery_images = Gallery.findAll()
        [fetched_value:fetched_value,all_menu:all_menu,gallery_images:gallery_images]
    }
    def create1 () {
        def imageMap = [:];
        byte[] photo=request.getFile("photos").bytes
        String type = request.getFile("photos").contentType
        String category = params.category;
        if (photo == null ) {
            imageMap.put("image", null);
            imageMap.put("imageContentType", null);
            imageMap.put("category", null);
        } else {
            imageMap.put("image", photo);
            imageMap.put("imageContentType", type);
            imageMap.put("category", category);
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
    def getImage(Long id) {
        def user = Member.get(id);
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
    def getMenu(Long id) {
        def user = Items.get(id);
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
        def imageMap = [:];
        byte[] menu_image=request.getFile("photos").bytes
        String menu_imageContentType = request.getFile("photos").contentType
        String catagory = params.menu_guest;
        String title = params.menu_title;
        String item_details = params.menu_price;
        String price = params.menu_details;
        if (menu_image == null ) {
            imageMap.put("catagory", null);
            imageMap.put("title", null);
            imageMap.put("item_details", null);
            imageMap.put("price", null);
            imageMap.put("image", null);
            imageMap.put("menu_imageContentType", null);
        } else {
            imageMap.put("catagory", catagory);
            imageMap.put("title", title);
            imageMap.put("item_details", item_details);
            imageMap.put("price", price);
            imageMap.put("image", menu_image);
            imageMap.put("imageContentType", menu_imageContentType);
        }

        Items newImage = new Items(imageMap);
        if(newImage.save()){
            redirect action:"admin"
        }else{
            render "Error..!!"
        }
    }
    
    def about() { 
        def all_menu = Items.list()
        [all_menu:all_menu]
    }
    def contact() { }
    def send1() {
        sendMail {
            to "abdussalam1502036@gmail.com"
            subject "Live Dinner Reservation"
            text "Customers Details\n\n\nName : " + params.name +"\nEmail Address : "+params.email+"\nNo. of Persion:"+params.person+"\n\nMessage From Customer :\n"+params.message;
        }

        render "Successfully send to the Restaurant Manager...";
    }
    def blog() {
        def fetched_value1 = Blogs.findAll() 
        [fetched_value1:fetched_value1]
     }
     def blog_ajax_req(){
        def imageMap = [:];
        byte[] image=request.getFile("photos").bytes
        String imageContentType = request.getFile("photos").contentType
        String title = params.title;
        String category = params.category;
        String datePart  = new Date();
        String timePart = "01:53 PM"
        String shortcut = params.shortcut;
        String details = params.details;
        if (image == null ) {
            imageMap.put("title", null);
            imageMap.put("category", null);
            imageMap.put("date", null);
            imageMap.put("time", null);
            imageMap.put("shortcut", null);
            imageMap.put("details", null);
            imageMap.put("image", null);
            imageMap.put("imageContentType", null);
        } else {
            imageMap.put("title", title);
            imageMap.put("category", category);
            imageMap.put("date", datePart);
            imageMap.put("time", timePart);
            imageMap.put("shortcut", shortcut);
            imageMap.put("details", details);
            imageMap.put("image", image);
            imageMap.put("imageContentType", imageContentType);
        }

        Blogs newImage = new Blogs(imageMap);
        if(newImage.save()){
            redirect action:"admin"
        }else{
            render "Error..!!"
        }
    }
    def getBlog(Long id) {
        def user = Blogs.get(id);
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

    def blog_details() { 
        def fetched_value1 = Blogs.findAll([sort: "date", order: "desc"]) 
        /*def catagory = Blogs.findAllByCatagoryIlike("%$params.catagory%")?.collect{it.catagory}
        def unique_catagory = catagory as Set*/

        ppost_id = params.post_id
        def postt_details = Blogs.findAllById(ppost_id)
        //def replyCmt = Reply.findAll()

        Blogs blogsObj = Blogs.get(postt_details.id)     
        def post_comments = Comment.findAllByBlogsInComment(blogsObj)

        def blogs = Blogs.findAllById(ppost_id)
        Blogs blogsObj1 = Blogs.get(blogs.id)
        
        def all_reply = Reply.findAllByBlogsInReply(blogsObj1)

        [all_reply:all_reply,postt_details:postt_details, fetched_value1:fetched_value1,post_comments:post_comments,ppost_id:ppost_id]

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
        def members = Member.findAll()
        [fetched_value:fetched_value,members:members]
    }
    def stuff_ajax_req(){
        def imageMap = [:];
        byte[] photo = request.getFile("photos").bytes
        String type  = request.getFile("photos").contentType
        String stuff_name = params.stuff_name;
        String position = params.stuff_position;
        if (photo == null ) {
            imageMap.put("stuff_name", null);
            imageMap.put("position", null);
            imageMap.put("image", null);
            imageMap.put("imageContentType", null);
        } else {
            imageMap.put("stuff_name", stuff_name);
            imageMap.put("position", position);
            imageMap.put("image", photo);
            imageMap.put("imageContentType", type);
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
    def reply_ajax_req(){
        def reply = params.reply
        def time = params.time
        def comtId = params.comtId

        def blogsFetch = Blogs.findAllById(ppost_id)
        Blogs blogsObj = Blogs.get(blogsFetch.id)

        def commentFetch = Comment.findAllById(comtId)
        Comment commentObj = Comment.get(commentFetch.id)

        Reply newReply = new Reply(blogsInReply:blogsObj,commentInReply:commentObj,reply:reply,time:time)
        if(newReply.save()){
            render "reply saved successfully"
        }else{
            render "Error"
        }
    }
    
}

package webpage

class WebPageController {

    def fetched_value = WebPage.list()
    def ppost_id;

    def index() { 
        [fetched_value:fetched_value]
    }
    def Menu() {
        [fetched_value:fetched_value]
     }
    def about() { }
    def contact() { }
    def blog() {
        def fetched_value1 = Blogs.list() 
        [fetched_value1:fetched_value1]
     }
    def blog_details() { 
        def fetched_value1 = Blogs.findAll([sort: "date", order: "desc"])  

        ppost_id = params.post_id
        def postt_details = Blogs.findAllById(ppost_id)

        Blogs blogsObj = Blogs.get(postt_details.id)     
        def post_comments = Comment.findAllByBlogsInComment(blogsObj)

        [postt_details:postt_details, fetched_value1:fetched_value1,post_comments:post_comments]

    }
    def reservation() { 
        [fetched_value:fetched_value]
    }
    def stuff() {
        [fetched_value:fetched_value]
    }
    def gallery() {
        [fetched_value:fetched_value]
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

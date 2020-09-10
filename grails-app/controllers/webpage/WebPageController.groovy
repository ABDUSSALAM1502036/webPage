package webpage

class WebPageController {

    def fetched_value = WebPage.list() 

    def index() { 
        [fetched_value:fetched_value]
    }
    def Menu() {
        [fetched_value:fetched_value]
     }
    def about() { }
    def contact() { }
    def blog() { }
    def blog_details() { }
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
}

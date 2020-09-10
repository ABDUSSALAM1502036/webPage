package webpage

class WebPageController {

    def fetched_value = WebPage.list() 


    def index() { }
    def Menu() { }
    def about() { }
    def contact() { }
    def blog() { }
    def blog_details() { }
    def reservation() { }
    def stuff() {}
    def gallery() {}
    def admin(){
        respond new WebPage(params)
    }
    def save(WebPage webPage) {
        webPage.save();
        redirect action:"admin", method:"GET"
    }
}

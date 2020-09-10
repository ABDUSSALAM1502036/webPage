package webpage

class Blogs {

    static hasMany = [comments: Comment, nestedCmts : NestedCmt]
    String title
    String date
    String time
    String post_shortcut
    String post_details

    static constraints = {
    }

    static mapping = {
       post_shortcut   sqlType: 'longText'
       post_details    sqlType: 'longText'
    }
}

class Comment{

    String username
    String email
    String time
    String post_comment
    static belongsTo = Blogs
    Blogs  blogsInComment
    static mapping = {
       post_comment   sqlType: 'longText'
    }
}

class NestedCmt{
    String current_time
    String reply_comment
    static belongsTo = [Blogs, Comment]
    Blogs  blogsInNestedCmt
    Comment commentInNestedCmt

    static mapping = {
       reply_comment   sqlType: 'longText'
    }
}

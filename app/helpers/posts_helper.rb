module PostsHelper
  def post_preview(post)
    content = post.content
    content.slice!(/\<!--more--\>[\w\W]*/)
    content.html_safe
  end
end

module MainHelper

  def format_bread_crumb( args={} )
    page_name = args.fetch(:page_name, "")
    output = link_to( "home", root_path )
    parents = args.fetch(:parents, [])
   
    parents.each do |parent|
      output += ' &raquo; '.html_safe
      output += link_to( "#{parent[0]}", parent[1] )
    end
    output += ' &raquo;'.html_safe + " #{page_name}"
  end

  def format_twitter_share_button( args={} )
    show_twitter = args.fetch(:show, false)
    tweet_text = args.fetch(:tweet_text, "")
    text = "text=#{tweet_text}"
    via = "&via=CollegeSTAR_ORG"
    output = ""
    if show_twitter
      output += "<div class='twitter-share-button'>"
      output += "<a class='twitter-share-button' href='https://twitter.com/intent/tweet?#{text}#{via}'>Tweet</a>"
      output += "</div>"
    end
    output.html_safe
  end

  def format_facebook_share_button( args={} )
    show_facebook = args.fetch(:show, false)
    href = request.original_url
    layout = "button"
    action= "like"
    size = "small"
    show_faces = "false"
    share = "true"
    output = ""
    if show_facebook
      output += "<div class='fb-like' data-href=#{href} data-layout=#{layout} data-action=#{action} data-show-faces=#{show_faces} data-share=#{share}></div>"
    end
    output.html_safe
  end
end

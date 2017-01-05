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
end

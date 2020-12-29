require 'json'

class SvgCoverTag < Liquid::Tag
  def initialize(tag_name, input, tokens)
    super
    input.gsub! '~~', '"'
    @input = input
    
  end
  
  def render(context)
    
    # Set defaults first, replace with your values!
    cntr = "xxxxxx"
    ttl = "yyyyy"
    time = "zzzzz"
    type = "playlist"
    
    # Attempt to parse the JSON if any is passed in
    begin
      if( !@input.nil? && !@input.empty? )
        jdata = JSON.parse(@input)
        # if( jdata.key?("cntr") )
        # end
        cntr = jdata['cntr'].strip
        ttl = jdata['ttl'].strip
        time = jdata['time'].strip
        # archive = jdata['archive'].strip
        settype = jdata['settype'].strip
        spotify = jdata['spotify'].strip
        mixcloud = jdata['mixcloud'].strip
        filename = jdata['filename'].strip
        
        string_length = 8
        randId = rand(36**string_length).to_s(36)
        
        
      end

    rescue
    end

    output = '{::nomarkdown}'
    # Write the output HTML string

    output += "<h4 id=\"#{time}-#{cntr}\">#{time} #{cntr}"

    if spotify && spotify.length > 0
      output += "<a href='#{spotify}' target='_blank' title='Go to playlist'> <i class='fab fa-spotify fa-inverse'></i></a>"
    end 

    if mixcloud && mixcloud.length > 0
      output += "<a href='#{mixcloud}' target='_blank' title='Go to show recording'> <i class='fab fa-mixcloud fa-inverse'></i></a>"
    end
    
    output += "</h4>"

    if filename && filename.length > 0
      output += "<img src=\"assets/owner/images/#{filename}.jpeg\" alt=\"cover art\" class=\"svg-cover img-responsive\">"
    else
      output += "<object id=\"#{randId}\" class=\"svg-cover img-responsive\" data-contributor=\"#{cntr}\" data-settitle=\"#{ttl}\""
      output += "data=\"assets/svg/#{settype}.svg\" type=\"image/svg+xml\"/>"
      output += '</object>'
      output += "<a class=\"download-button link-button pink\" data-target=\"#{randId}\" data-toggle=\"tooltip\" data-original-title=\"Download\"> Dw </a>"
    end
    output += '{:/}'
    # Render it on the page by returning it
    return output; 
  end
end
Liquid::Template.register_tag('cover', SvgCoverTag)
require 'json'

class SvgCoverTag < Liquid::Tag
  def initialize(tag_name, input, tokens)
    super
    input.gsub! '~~', '"'
    @input = input
    
  end
  
  def render(context)

    showTypes = {
			'playlist' => 'Playlist',
			'repeat' => 'Playlist Replay',
			'dgt-dj' => 'Live DJ Set',
			'vin-dj' => 'Live DJ Set',
			'pre-dj' => 'Pre-recorded DJ Set',
			'colab' => 'Collaborative Playlist',
			'quiz' => 'Quiz',
			'talk' => 'Live Radio Show'
		}

    
    # Set defaults first, replace with your values!
    cntr = "xxxxxx"
    ttl = "yyyyy"
    time = "zzzzz"
    type = "playlist"
    bg = "#29878D"

    
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

        bg = jdata['bg'].strip
        
        string_length = 8
        randId = rand(36**string_length).to_s(36)
        
        
      end

    rescue
    end

    # define our inline SVG

    # inlineSvg = '<?xml version="1.0" encoding="UTF-8"?>';
    inlineSvg = "<svg id=\"#{randId}\" class=\"svg-cover img-responsive\" data-contributor=\"#{cntr}\" data-settitle=\"#{ttl}\" data-settype=\"#{settype}\" data-bg=\"#{bg}\" version=\"1.1\" viewBox=\"0 0 600 600\"";
    inlineSvg += '  xmlns="http://www.w3.org/2000/svg">';
    inlineSvg += '  <g fill-rule="evenodd">';
    inlineSvg += '    <g id="Assets" transform="matrix(3.5294 0 0 3.5294 0 -.00014746)" fill="none" fill-rule="evenodd">';
    inlineSvg += '      <rect id="background" y=" .62754" width="170" height="170" fill="#29878d"/>';
    inlineSvg += '      <g id="vinyl-dj" display="none" transform="translate(127.478710, 51.500000)">';
    inlineSvg += '        <path id="Path" fill="#FFFFFF" fill-rule="nonzero" d="M10.375125,0.647349287 C4.645125,0.647349287 -4.29878355e-13,2.59664281 -4.29878355e-13,5.00119638 C-4.29878355e-13,7.40574996 4.645125,9.35504348 10.375125,9.35504348 C16.105125,9.35504348 20.75025,7.40574996 20.75025,5.00119638 C20.75025,2.59664281 16.105125,0.647349287 10.375125,0.647349287 Z"></path>';
    inlineSvg += '        <ellipse id="Oval" fill="#FFFFFF" cx="10.375125" cy="4.3538471" rx="10.3125" ry="4.32756696"></ellipse>';
    inlineSvg += '        <ellipse id="vinyl-colour" fill="#29878d" fill-rule="nonzero" cx="10.375125" cy="4.3538471" rx="1" ry="1"></ellipse>';
    inlineSvg += '        <path id="vinyl-colour" fill="#29878d" fill-rule="nonzero" d="M10.375125,0 C4.645125,0 0,1.94929353 0,4.3538471 C0,6.75840067 4.645125,8.7076942 10.375125,8.7076942 C16.105125,8.7076942 20.75025,6.75840067 20.75025,4.3538471 C20.75025,1.94929353 16.105125,0 10.375125,0 Z M6.41925,1.08283594 C7.606875,0.829476563 8.95125,0.68658817 10.375125,0.68658817 C10.45875,0.68658817 10.541625,0.687060268 10.6245,0.688004464 C10.762125,0.689578125 10.856625,0.833095982 10.836,1.00667076 L10.73025,1.90003795 C10.709625,2.07361272 10.621875,2.21256696 10.534125,2.2114654 C10.48125,2.21083594 10.428375,2.21052121 10.375125,2.21052121 C9.62625,2.21052121 8.914875,2.27818862 8.274,2.39967522 C7.896375,2.47127679 7.4445,2.42863058 7.23375,2.27897545 L6.14775,1.50835379 C5.937,1.35869866 6.049875,1.16167634 6.41925,1.08283594 Z M5.99475,2.72164621 L4.3905,2.13278237 C4.0785,2.01837723 4.04625,1.81899442 4.345875,1.69908147 C4.353,1.69624888 4.35975,1.69357366 4.36725,1.69074107 C4.668,1.57114286 5.139375,1.5955346 5.393625,1.73260045 L6.703875,2.43822991 C6.9585,2.57529576 7.01775,2.73549442 6.8505,2.802375 C6.682875,2.86957031 6.30675,2.83605134 5.99475,2.72164621 Z M6.703875,4.3538471 C6.703875,3.50296875 8.3475,2.81323326 10.375125,2.81323326 C12.40275,2.81323326 14.046375,3.50296875 14.046375,4.3538471 C14.046375,5.20472545 12.40275,5.89446094 10.375125,5.89446094 C8.3475,5.89446094 6.703875,5.20472545 6.703875,4.3538471 Z M14.31375,7.62847768 C13.13025,7.87963393 11.791875,8.02110603 10.375125,8.02110603 C10.282125,8.02110603 10.1895,8.02047656 10.09725,8.019375 C9.943875,8.01732924 9.83775,7.87318192 9.86025,7.69960714 L9.9765,6.80639732 C9.999375,6.63282254 10.09725,6.49465513 10.19625,6.49607143 C10.2555,6.49685826 10.315125,6.49733036 10.375125,6.49733036 C11.062875,6.49733036 11.718375,6.44036384 12.31725,6.3371317 C12.7005,6.27103795 13.170375,6.31447098 13.396125,6.46019196 L14.559,7.21082812 C14.78475,7.35639174 14.6835,7.54995201 14.31375,7.62847768 Z M16.357125,7.02733929 C16.069875,7.14064286 15.60525,7.11404799 15.3435,6.97934263 L13.99725,6.28583036 C13.7355,6.151125 13.66875,5.99501786 13.834125,5.93096987 C13.999875,5.86692188 14.37525,5.90280134 14.686875,6.01736384 L16.291875,6.60654241 C16.603875,6.72094754 16.64475,6.91403571 16.357125,7.02733929 Z"></path>';
    inlineSvg += '      </g>';
    inlineSvg += '      <g id="dgt-dj" transform="translate(126.4 53.053)" fill="#fff" display="none">';
    inlineSvg += '        <path d="m2.2985 2.4548c0 2.1367 3.7829 3.8689 8.4493 3.8689 4.6664 0 8.4493-1.7322 8.4493-3.8689 0-0.93028-0.71705-1.7839-1.9119-2.4512 2.5605 0.89843 4.2104 2.3135 4.2104 3.905 0 2.718-4.8119 4.9214-10.748 4.9214-5.9358 0-10.748-2.2034-10.748-4.9214 0-1.5922 1.6512-3.0077 4.2122-3.9072-1.1959 0.6686-1.9137 1.5226-1.9137 2.4534z"/>';
    inlineSvg += '        <ellipse cx="10.748" cy="2.4548" rx="3.8689" ry="1.7715"/>';
    inlineSvg += '      </g>';
    inlineSvg += '      <path id="playlist" display="none" d="m127.97 49c-3.5875 0-6.4959 2.9083-6.4959 6.4959 0 3.5879 2.9084 6.4961 6.4959 6.4961 3.5877 0 6.496-2.9082 6.496-6.4961 0-3.5873-2.9081-6.4956-6.496-6.4956zm2.979 9.3689c-0.11666 0.19137-0.36598 0.25133-0.55672 0.13474-1.5254-0.93231-3.4454-1.1429-5.7066-0.62638-0.21789 0.04996-0.43508-0.08664-0.48472-0.30446-0.0499-0.21789 0.0861-0.43509 0.30453-0.48473 2.4745-0.56572 4.597-0.32223 6.3092 0.72404 0.19083 0.11714 0.25133 0.36614 0.1342 0.55695zm0.79509-1.7685c-0.14692 0.23837-0.45859 0.31315-0.69666 0.16677-1.7457-1.0731-4.4077-1.3839-6.473-0.757-0.26785 0.0809-0.55074-0.07005-0.63204-0.33743-0.0807-0.26785 0.0704-0.55021 0.33774-0.63166 2.3591-0.71581 5.2919-0.36908 7.2971 0.86312 0.23815 0.14661 0.31339 0.45844 0.16678 0.69626zm0.0683-1.8418c-2.0939-1.2435-5.5478-1.3579-7.5467-0.75119-0.32098 0.09735-0.66043-0.08386-0.7577-0.40484-0.0973-0.32114 0.0838-0.66035 0.40499-0.75794 2.2946-0.69658 6.1091-0.56199 8.5195 0.86894 0.28872 0.17135 0.38343 0.54423 0.21231 0.83256-0.17065 0.28872-0.54454 0.38389-0.83232 0.21247z" fill="#fff" fill-rule="nonzero"/>';
    inlineSvg += '      <path id="quiz" display="none" fill="#FFFFFF" fill-rule="nonzero" d="M131.16102,47.7267141 C129.035848,47.7267141 126.97871,49.375494 126.97871,51.7075327 C126.97871,54.7333956 129.244128,55.3670504 129.244128,57.4854427 L133.077912,57.4854427 C133.077912,55.3670504 135.34333,54.7333956 135.34333,51.7075327 C135.34333,49.375494 133.286191,47.7267141 131.16102,47.7267141 Z M130.4624,49.0708406 C130.49063,49.2299095 130.392102,49.4021545 130.240667,49.4584519 C129.391449,49.7786582 128.753281,50.5306132 128.590607,51.4461383 C128.55781,51.6257755 128.364535,51.7593828 128.184905,51.7265918 C128.005258,51.6938025 127.87165,51.500524 127.904446,51.3208868 C128.110408,50.1618119 128.913011,49.2166028 129.990147,48.8104116 C130.189399,48.7293933 130.426223,48.8968478 130.4624,49.0708406 Z M129.244128,58.1824944 L129.244128,58.8795461 L133.077912,58.8795461 L133.077912,58.1824944 L129.244128,58.1824944 Z M129.244128,59.5765977 C129.244128,59.9770714 129.573397,60.2736494 129.941179,60.2736494 L132.38086,60.2736494 C132.748642,60.2736494 133.077912,59.9770714 133.077912,59.5765977 L129.244128,59.5765977 Z M130.463968,60.6221752 C130.463968,61.0083419 130.774853,61.3192269 131.16102,61.3192269 C131.547186,61.3192269 131.858071,61.0083419 131.858071,60.6221752 L130.463968,60.6221752 Z"></path>';
    inlineSvg += '      <g id="Artboard" transform="translate(-424,-1654)">';
    inlineSvg += '        <g id="Group" transform="translate(424 1653.4)">';
    inlineSvg += '          <g id="Headphone-Guy" transform="translate(35.5,50.5)">';
    inlineSvg += '            <g id="Logo-final" fill="#fff">';
    inlineSvg += '              <path id="Combined-Shape" d="m6.4215 21.815c-2.2142 4.146-3.5302 9.4401-3.5302 15.185s1.316 11.039 3.5302 15.185c-3.731-2.1179-6.4215-8.1159-6.4215-15.185 0-6.943 2.5957-12.853 6.224-15.067z"/>';
    inlineSvg += '              <path d="m18.641 14c-8.1462 0-14.75 10.297-14.75 23s6.6038 23 14.75 23c0.63149 0 1.2537-0.06188 1.8639-0.18275-5.9836-5.816-9.6139-13.453-9.6139-21.817 0-9.114 4.3105-17.365 11.279-23.337-1.1309-0.43299-2.313-0.66263-3.5295-0.66263z" fill-rule="nonzero"/>';
    inlineSvg += '              <path transform="matrix(-1 0 0 1 191.18 0)" d="m98.799 21.815c-2.2142 4.146-3.5302 9.4401-3.5302 15.185s1.316 11.039 3.5302 15.185c-3.731-2.1179-6.4215-8.1159-6.4215-15.185 0-6.943 2.5957-12.853 6.224-15.067z"/>';
    inlineSvg += '              <path transform="matrix(-1 0 0 1 171.54 0)" d="m91.379 14c-8.1462 0-14.75 10.297-14.75 23s6.6038 23 14.75 23c0.63149 0 1.2537-0.06188 1.8639-0.18275-5.9836-5.816-9.6139-13.453-9.6139-21.817 0-9.114 4.3105-17.365 11.279-23.337-1.1309-0.43299-2.313-0.66263-3.5295-0.66263z" fill-rule="nonzero"/>';
    inlineSvg += '              <path d="m49.391 0.5c22.813 0 41.467 15.503 42.382 35l-2.0025 2.66e-4c-0.92008-18.324-18.617-33-40.379-33s-39.459 14.676-40.379 33l-2.0025-2.66e-4c0.91425-19.497 19.569-35 42.382-35z" fill-rule="nonzero"/>';
    inlineSvg += '              <path d="m49.391 5.8524c20.714 0 37.506 14.393 37.506 32.148s-16.792 32.148-37.506 32.148c-20.714 0-37.506-14.393-37.506-32.148s16.792-32.148 37.506-32.148zm0 6.3976c-16.43 0-29.75 10.633-29.75 23.75s13.32 23.75 29.75 23.75c16.43 0 29.75-10.633 29.75-23.75s-13.32-23.75-29.75-23.75z"/>';
    inlineSvg += '              <rect transform="rotate(15 31.342 37.559)" x="22.918" y="36.794" width="16.848" height="1.5316" rx=".7658"/>';
    inlineSvg += '              <rect transform="matrix(-.96593 .25882 .25882 .96593 122.67 -16.15)" x="58.918" y="36.794" width="16.848" height="1.5316" rx=".7658"/>';
    inlineSvg += '            </g>';
    inlineSvg += '          </g>';
    inlineSvg += '        </g>';
    inlineSvg += '      </g>';
    inlineSvg += '    </g>';
    inlineSvg += '    <text fill="#ffffff" font-size="35.294px" font-weight="bold" letter-spacing="5.8824" stroke-width="3.5294" text-align="center" text-anchor="middle">';
    inlineSvg += '      <tspan id="contributor" x="299.95694" y="90.654732"></tspan>';
    inlineSvg += '    </text>';
    inlineSvg += '    <text fill="#ffffff" font-size="25px" text-align="center" text-anchor="middle">';
    inlineSvg += '      <tspan id="settype" x="299.95694" y="140"></tspan>';
    inlineSvg += '    </text>';
    inlineSvg += '    <text fill="#ffffff" font-size="28.235px" font-weight="bold" stroke-width="3.5294" text-align="center" text-anchor="middle">';
    inlineSvg += '      <tspan id="settitle" x="299.62088" y="530.06653"></tspan>';
    inlineSvg += '    </text>';
    inlineSvg += '  </g>';
    inlineSvg += '</svg>';

    output = '{::nomarkdown}'
    # Write the output HTML string

    output += "<h4 id=\"#{time}-#{cntr}\">#{time} #{cntr}"

    if spotify && spotify.length > 0
      output += "<a href='#{spotify}' target='_blank' title='Go to playlist'> <i class='fab fa-spotify fa-inverse'></i></a>"
    end 

    if mixcloud && mixcloud.length > 0
      output += "<a href='#{mixcloud}' target='_blank' title='Go to show recording'> <i class='fab fa-mixcloud fa-inverse'></i></a>"
    end
    output += "</h4><h5>#{showTypes[settype]}</h5>"
    

    
    if filename && filename.length > 0
      output += "<img src=\"assets/owner/images/#{filename}.jpeg\" alt=\"cover art\" class=\"cover img-responsive\">"
    else
      # output += "<object id=\"#{randId}\" class=\"svg-cover img-responsive\" data-contributor=\"#{cntr}\" data-settitle=\"#{ttl}\" data-settype=\"#{settype}\" data-bg=\"#{bg}\""
      # output += "data=\"assets/svg/glastonaut.svg\" type=\"image/svg+xml\"/>"
      # output += '</object>'
      # output += "<a class=\"download-button link-button pink\" data-target=\"#{randId}\" data-toggle=\"tooltip\" data-original-title=\"Download\"> Dw </a>"
      output += inlineSvg
    end
    output += '{:/}'
    # Render it on the page by returning it
    return output; 
  end
end
Liquid::Template.register_tag('cover', SvgCoverTag)
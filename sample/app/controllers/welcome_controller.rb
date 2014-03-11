class WelcomeController < ApplicationController
  def index
  flash[:notice]="post created" # is passed on to the next immediate action directly ,is used to store temp objcts btw actions
  
  end
  def display
    @url=  request.original_url # to get the current url path with parameters
    @decode_url=URI.encode_www_form(URI.decode_www_form(URI(@url ).query || []) << ["param","value"] << ["param2","value2"]).to_s
     # url parameter added to the decoded query of the uri object of the url and then encoded back 
    
    session[:username]=@username
    
    @check=session[:username]
    @actual_url = @url.split("?")[0]
    @redi=@actual_url << "?" << @decode_url
    #redirect_to :action =>  "redirected"
    #redirect_to :action =>  @redi
    @hash_url=Rack::Utils.parse_query URI(@url ).query # parse parameters and store them in a hash table
    i=0
    @processed_values=""
    while i <@hash_url.size
    @processed_values << @hash_url[@hash_url.keys[i]] #"<<" concatenation operator
      i+=1
    end
	#@hash_url.each{|k,v| @processed_values << v }
  end
  def redirected 
  
    @message="this is redirected "
    #redirect_to :action =>  "display"
  end
end

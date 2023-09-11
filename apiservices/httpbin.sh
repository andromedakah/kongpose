#bin/sh 
  
#service creation  
echo "httpbin service creation"
if(curl --request "POST" --header "Kong-Admin-Token: password" --data-urlencode 'name=httpbin' --data-urlencode 'url=http://httpbin.org' 'http://api.kong.lan/services/' | grep "HTTP/1.1 201 Created" | tr -d '\r' ); 
    then
        echo "httpbin service created"
    else
        echo "httpbin service not created"
    fi

#route creation  
echo "httpbin route creation"
if(curl --request POST --data 'paths[]=/httpbin' --data name=httpbin --header 'Kong-Admin-Token: password' 'http://api.kong.lan/services/httpbin/routes' | grep "HTTP/1.1 201 Created" | tr -d '\r' );
    then
        echo "httpbin route created"
    else
        echo "httpbin route not created"
    fi

echo "httpbin service creation"
if (curl --request GET "http://api.kong.lan/services/httpbin" --header 'Kong-Admin-Token: password' | grep "HTTP/1.1 200 OK" | tr -d '\r' ); 
    then
        echo "httpbin service response OK"
    else
        echo "httpbin service response not OK"
    fi
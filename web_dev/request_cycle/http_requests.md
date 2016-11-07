What are some common HTTP status codes?

200 - OK - Everything is good. Response is ideal
300 - MULTIPLE CHOICES - Too many choices fulfill the parameters of the request and server doesn't know which to send
301 - MOVED PERMANENTLY - Requested resource has been assigned a new permanent URI and future references should use one of the returned choices
302 - FOUND- Requested resource is in the process of being moved. This is a warning that a 301 may be in store?
304 - NOT MODIFIED - This feature allows efficient updates of local cache information (including relevant meta info) without requiring the overhead of multiple HTTP requests?
307 - TEMPORARY REDIRECT - Requested resource resides temporarily under a different URI. Client should continue to use the same request-URI for future
400 - BAD REQUEST - Request could not be understood by the server do to bad syntax. Client must modify request before repeating
401 - UNAUTHORIZED - Request requires user authentication. The response MUST include a WWW-Authenticate header field containing a challenge applicable to the requested resource
403 - FORBIDDEN - Server understood the request, but is refusing to fulfill it. Authorization will not help and the request SHOULD NOT be repeated
404 - NOT FOUND - Server has not found anything matching the Request-URI. Don't know if condition is temporary or permanent
410 - GONE - Requested resource no longer available. No forwarding address known. Considered a permanent condition. 
500 - INTERNAL SERVER ERROR - Server encountered an unexpected condition which prevented it from fulfilling the request 
501 - NOT IMPLEMENTED - Server does not support the functionality required to fulfill the request. This is the appropriate response when the server does not recognize the request method and is not capable of supporting it for any resource
503 - SERVICE UNAVAILABLE - Web server is unable to handle your HTTP request at the time. Many reasons why this is the case. Including: Server Crash, Server Maintenance, Server Overload, Server Maliciously Being Attacked, Website Has Used Up It's Allotted Bandwidth, Server May Be FORBIDDEN To Return Requested Document... This is usually temporary since people have made the server return this code until the fix the problem
550 - PERMISSION DENIED - The account you're using doesn't have permission to perform the action you are attempting.

What is the difference between a GET request and a POST request? When might each be used?

GET - Requests data from a specified resource (use when web browsing, getting into click-holes, exploring websites)
POST - Submits data to be processed to a specified resource (use when submitting passwords, sending info, or when you don't want a record of what you're sending)

Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?

Cookies store information in text for later use by your web browser. Their main purpose is to identify users and sometimes prepare customized web pages or save site login information for you. So, if you choose 'remember me' when logging into a website, a cookie is where that information is stored, and it's what's sent to the web server.
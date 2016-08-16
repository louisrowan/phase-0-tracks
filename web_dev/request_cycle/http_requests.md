# Release 0

# What are some common HTTP status codes?
200: Standard response for successful HTTP requests

404 Not Found: This means that the requested page/resource cannot be found

403 Forbidden: This means that access to the requested resource is forbidden

500 Internal Server Error: When page cannot load but the specific problem is unknown

503 Service Unavailable: Means that the web server is not available. Could be down temporarily, overloaded, etc.

# What is the difference between a GET request and a POST request?
GET is used to request data from a resource, like to load a page.
GET requests remain in browser history, can be bookmarked, only retrieve data.

POST is used to submit data that will be processed to a resource
POST requests are not saved to history or bookmarked. Reloading a POST request can re-submit data a second time.


# What is a cookie?
A small amount of data from a website that is saved by a web browser. Most common example would be a browser remembering login information. "Session" cookies only last while browser is open, "Persistant" cookies can last up to a few years. Cookies only apply to one browser at a time, so they do not transfer over to a second browser on the same computer.
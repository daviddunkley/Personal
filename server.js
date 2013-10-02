var http = require('http')
//var request = require('request')

var port = process.env.PORT || 1337;


function getClientIp(req)
{
	// need to obtain the last address in the header variable
	var sockets = req.headers['x-forwarded-for'].split(",");
	var socket = sockets[sockets.length-1];
	// remove the port number if given
	var client_ip = socket.split(":")[0];
	
	return client_ip;
}

function getCountryCode2(ip_address, res)
{
    var httpRequest = require('request');
    var url = "http://geoip.maxmind.com/a?l=ue5v7rj3nfKP&i=" + ip_address;
	
	res.write("Calling " + url + "\n");

    httpRequest.get({
        url: url
	}, function(err, response, body) {
		if (err) {
			return 'Error occurred';
		} else if (response.statusCode !== 200) {
			return 'Country found for ' + ip_address + '.';
		} else {
			res.write("Got Here");
			return body;
		}
	});
	res.write("Called\n");
}

http.createServer(function(req, res) {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  
  var client_ip = getClientIp(req);
  var client_country = getCountryCode2('8.8.8.8', res);
  
  //res.write('Client IP: ' + client_ip + '\n');
  res.write('Client IP: ' + client_country + '\n');
  res.end('Hello Azure\n');
}).listen(port);
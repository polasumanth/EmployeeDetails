var _expressPackage = require("express");  
var _bodyParserPackage = require("body-parser");  
var _sqlPackage = require("mssql");  
//Initilize app with express web framework  
var app = _expressPackage();  
//To parse result in json format  
app.use(_bodyParserPackage.json());  
  
//Here we will enable CORS, so that we can access api on cross domain.  
app.use(function (req, res, next) {  
    res.header("Access-Control-Allow-Origin", "*");  
    res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");  
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, contentType,Content-Type, Accept, Authorization");  
    next();  
});  
  
//Lets set up our local server now.  
var server = app.listen(process.env.PORT || 4000, function () {  
    var port = server.address().port;  
    console.log("App now running on port", port);  
});  
  
//Set up your sql connection string, i am using here my own, you have to replace it with your own.  
var dbConfig = {
    user:  "admin1",
    password: "admin@123",
    server: "mstesting.database.windows.net",
    database: "ED",
	options:{
		encrypt:true
	}
};
//Function to connect to database and execute query  
var QueryToExecuteInDatabase = function (response, strQuery) {  
    //close sql connection before creating an connection otherwise you will get an error if connection already exists.  
    _sqlPackage.close();  
    //Now connect your sql connection  
    _sqlPackage.connect(dbConfig, function (error) {  
        if (error) {  
            console.log("Error while connecting to database :- " + error);  
            response.send(error);  
        }  
        else {  
            //let's create a request for sql object  
            var request = new _sqlPackage.Request();  
            //Query to run in our database  
            request.query(strQuery, function (error, responseResult) {  
                if (error) {  
                    console.log("Error while connecting to database:- " + error);  
                    response.send(error);  
                }  
                else {  
                    response.send(responseResult.recordset);  
                }  
            });  
        }  
    });             
 }  
  
//GET API  
app.get("/getemployees", function(_req ,_res){  
    var Sqlquery = "select  t.*,t1.street_Name,t1.City,t1.[State],t1.Country,t1.zipcode,t1.phone_number from employee as t join employee_Address as t1 on t.Address_ID=t1.Address_ID";  
    QueryToExecuteInDatabase(_res, Sqlquery);  
});  
app.post("/insertaddress", function(request ,response){  
var jsonRequest = request.body;
    var Sqlquery = "EXEC	[dbo].[proc_address_update]		@EmployeeID = "+Number(jsonRequest.ID)+",@StreetName = N'"+jsonRequest.street_Name+"',@City = N'"+jsonRequest.City+"',		@State = N'"+jsonRequest.State+"',		@Country = N'"+jsonRequest.Country+"',		@ZipCode = "+Number(jsonRequest.zipcode)+",		@Phone = N'"+jsonRequest.phone_number+"'";  
    QueryToExecuteInDatabase(response, Sqlquery);  
}); 
app.post("/deleteemployee", function(request ,response){  
var jsonRequest = request.body;
    var Sqlquery = "DELETE FROM [dbo].[Employee] WHERE ID="+jsonRequest.ID;  
    QueryToExecuteInDatabase(response, Sqlquery);  
}); 
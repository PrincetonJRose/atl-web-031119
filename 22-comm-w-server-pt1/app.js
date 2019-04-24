let express = require('express');

let app = express();
app.get('/',function(req,res){
    res.sendFile('db.json');
});

app.listen(2000);
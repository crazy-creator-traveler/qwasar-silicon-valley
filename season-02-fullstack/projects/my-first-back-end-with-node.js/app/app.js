/*
**
    Main Program Code

NOTE:
    All necessary info contained in README.md
**
*/

const express = require('express');
const app = express();
const port = 8090;
const basicAuth = require('express-basic-auth');

function toString(array)
{
    let string = "";
        for(s = 0; s < array.length; s++) 
        {
            string += array[s];
        };
return string;
};

app.get('/', (_req, res) => {
    const songs =   [
                        "Accidents Will Happen",    "After You've Gone",    "Alice Blue Gown",  "All Alone",    "All By Myself",
                        "All I Do Is Dream of You", "All My Tomorrows",     "All of Me",        "All of You",   "All or Nothing at All",
                        "All the Things You Are",   "All the Way",          "All the Way Home", "Angel Eyes",   "All This and Heaven Too",
                        "Anytime, Anywhere",        "Any Time at All",      "Around the World", "Blue Moon",    "Christmas Dreaming"
                    ];
    const randomSongs = Math.floor(Math.random() * songs.length);
res.send(songs[randomSongs]);
});

app.get('/birth_date', (_req, res) => {
    const b_date = "December 12, 1915";
res.send(b_date);
});

app.get('/birth_city', (_req, res) => {
    const b_city = "Hoboken, New Jersey, U.S";
res.send(b_city);
});

app.get('/wives', (_req, res) => {
    let wives = [
                    "Nancy Barbato, ",
                    "Ava Gardner, ",
                    "Mia Farrow, ",
                    "Barbara Marx"
                ];
    wives = toString(wives);
res.send(wives);
});

app.get('/picture', (_req, res) => {
    const picture = "<img src='https://upload.wikimedia.org/wikipedia/commons/a/af/Frank_Sinatra_%2757.jpg'>"; 
res.send(picture);
});

app.get('/public', (_req, res) => {
    const public = "Everybody can see this page";
res.send(public);
});

app.get('/protected', basicAuth({ users: {'admin':'admin'}, unauthorizedResponse: "Not authorized" }), (_req, res) => {
    const protected = "Welcome, authenticated client";    
res.send(protected);
});
                                        
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
}); 

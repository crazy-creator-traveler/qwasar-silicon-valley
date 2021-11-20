<h1 align="center">My Users App</h1>

<h2>Topics:</h2>
<ul>
    <li><a href="#project-description"><b>Project Description</b></a></li>
    <li><a href="#getting-started"><b>Getting Started</b></a></li>
    <li><a href="#documentation"><b>Documentation</b></a></li>
    <li><a href="#technology-stack"><b>Technology Stack</b></a></li>
</ul>
<hr>

<!--Project Description-->
<div>
    <h2>Project Description</h2>
    <p><b>My Users App</b> is a Web-Application that was implemented using the very famous Architecture Pattern > <b>MVC | Model View Controller</b>.</p>
    <p><b>MVC</b> is the most popular Architecture for building complex Web-Servers. It is used by many Frameworks, and implemented into nearly every modern Web-Application.</p>
    <p><b>MVC</b> divides application into 3-Components > Each with a specific responsibility.</p>
    <ul>
        <li><b>Model</b></li>
        <p>The Model handles data validation, logic, and persistence. It interacts directly with the database to handle the data. The Controller will get all of its data information by asking the Model about the data.</p>
        <li><b>View</b></li>
        <p>The View handles presenting the information. It will usually render dynamic HTML pages based on the data the model fetches. The Controller is responsible for passing that data between the Model and View, so that the Model and View never have to interact with each other.</p>
        <li><b>Controller</b></li>
        <p>The Controller handles user requests and delegates information between the Model and the View. It only deals with requests, and never handles data or presentation.</p>
    </ul>
    <div align="center">
        <img width="800" height="500" src="public/img/mvc-architecture_pattern.png">
    </div>
    <div>
        <h3>Additional Sources:</h3>
        <ul>
            <li><a href="https://www.youtube.com/watch?v=DUg2SWWK18I"><b>MVC Explained in 4 Minutes</b></a></li>
            <li><a href="#">...</a></li>
        </ul>
    </div>
    <br>
    <br>
    <p>The main goal of this project was to get acquainted and implement a Web-Application using the MVC Architecture.</p>
</div>
<hr>

<!--Getting Started-->
<div>
    <h2>Getting Started</h2>
    <ol type="1">
        <li><h3>Installing && Running The Web-Application</h3></li>
            <ol type="1">
                <li><b>Clone the repository</b></li>
                    <p><code>$ git clone git@github.com:Crazy-Creators-Zone/qwasar-silicon-valley.git</code></p>
                    <p>(This information will be updated soon)</p><br>
                <li><b>Make sure the Ruby-Programming Language is installed</b></li>
                    <p><code>$ ruby -v</code></p>
                    <span>Your Terminal should display the Ruby version something like this:</span>
                    <p><code>$ ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux]</code></p>
                    <p>Otherwise, you will need to install Ruby > Follow this link
                        <a href="https://www.ruby-lang.org/en/documentation/installation/" target="_blank">Ruby Installation Guide</a>
                    </p><br>
                <li><b>Make sure the Bundle Gem is installed</b></li>
                    <p><code>$ bundle -v</code></p>
                    <span>Your Terminal should display the Bundler version something like this:</span>
                    <p><code>$ Bundler version 2.2.29</code></p>
                    <span>Otherwise, you will need to install Bundle Gem</span>
                    <p><code>$ gem install bundler</code></p><br>
                <li><b>Move to <code>my_users_app</code> Directory</b></li>
                    <p><code>$ cd my_users_app</code></p><br>
                <li><b>Run the following command to install all the required Gems that are listed in the Gemfile</b></li>
                    <p><code>$ bundle install</code></p><br>
                <li><b>Move to <code>app/сontrollers</code> Directory and Run the Web-Server</b></li>
                    <p><code>$ cd app/controllers</code></p>
                    <p><code>$ ruby app.rb</code></p><br>
                <li><b>Go to <code>http://localhost:8090/users</code> And you'll see > All Users-Data</b></li><br>
            </ol><br>
        <li><h3>Running Built-In Tests</h3></li>
        <p>...</p>
    </ol>
</div>
<hr>

<!--Documentation-->
<div>
    <h2>Documentation</h2>
    <p>Soon ...</p>
</div>
<hr>

<!--Technology Stack-->
<div>
    <h2>Technology Stack</h2>
    <p>Soon ...</p>
</div>
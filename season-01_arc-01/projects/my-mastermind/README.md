<h1 align="center">My Mastermind</h1>

<h2>Documentation:</h2>
<ul>
    <li><a href="#project-description"><b>Project Description</b></a></li>
    <li><a href="#getting-started"><b>Getting Started</b></a></li>
    <li><a href="#technology-stack"><b>Technology Stack</b></a></li>
</ul>
<hr>

<!--Project Description-->
<div>
    <h2>Project Description</h2>
    <p><b>My Mastermind</b> is implementation of the famous Mastermind Game.</p>
    <p>It is a console game fully implemented in the C-Programming Language.</p><br>
    <h3>Game Instruction</h3>
    <p>The game consists of:</p>
    <ol>
        <li>Two Players</li>
        <ul>
            <li>CodeMaker</li>
            <p>This player must secretly сreate a Secret Code and provide information about the number of attempts to crack the Secret Code.</p>
            <li>CodeBreaker</li>
            <p>This player must crack the Secret Code using a combination of deductive reasoning and trial and error in the game.</p>
        </ul><br>
        <li>Secret Code</li>
        <p>Secret Code consist of 4 distinct pieces and can be:</p>
        <ul>
            <li>Only digits from 0-7.</li>
            <li>Only 4 Different digits.</li>
        </ul><br><br>
        <li>Attempts</li>
        <p>The number of Attempts to crack the Secret Code can be from 1 to 99 (10 Attempts are provided by default).</p>
        <p>After each input the game indicates to the CodeBreaker the number of:</p>
        <ul>
            <li>Well Placed Pieces</li>
            <p>This means that the digit or digits are present in the Secret Code and the digit or digits are in the correct sequence.</p>
            <li>Misplased Pieces</li>
            <p>This means that the digit or digits are present in the Secret Code but the digit or digits are in the wrong sequence.</p>
        </ul>
    </ol><br>
    <p>If CodeBreaker cracks the Secret Code he or she wins and Game Stops.</p>
</div>
<hr>

<!--Getting Started-->
<div>
    <h2>Getting Started</h2>
    <ol type="1">
        <li><h3>Installing The Game</h3></li>
        <ol type="1">
            <li><b>Clone the repository</b></li>
                <p><code>$ git clone --depth 1 --filter=blob:none --sparse https://github.com/Crazy-Creators-Zone/qwasar-silicon-valley.git</code></p>
                <p><code>$ cd qwasar-silicon-valley</code></p>
                <p><code>$ git sparse-checkout set season-01_arc-01/projects/my-mastermind</code></p><br>
            <li><b>Move to <code>my-mastermind</code></b> Directory</li>
                <p><code>$ cd season-01_arc-01/projects/my-mastermind</code></p>
        </ol><br>
        <li><h3>Running The Game</h3></li>
        <ul>
            <li>Running with default parameters</li>
                <p><code>$ cd app</code></p>
                <p><code>$ ./my_mastermind</code></p>
                <p> Secret Code: 5432 (Generated random)<br>
                    Attempts   : 10 (By default)
                </p><br>
            <li>Running with user settings for the Secret Code</li>
                <p><code>$ cd app</code></p>
                <p><code>$ ./my_mastermind -c "1234"</code></p>
                <p> Secret Code: 1234<br>
                    Attempts   : 10 (By default)
                </p><br>
            <li>Running with user settings for the Attempts</li>
                <p><code>$ cd app</code></p>
                <p><code>$ ./my_mastermind -t "20"</code></p>
                <p> Secret Code: 5432 (Generated Random)<br>
                Attempts   : 20
                </p>
        </ul><br>
        <h4>NOTE:</h4>
        <p>You can't run the game with user settings for the Secret Code && Attempts at the same time!</p>
    </ol>
</div>
<hr>

<!--Technology Stack-->
<div>
    <h2>Technology Stack</h2>
    <ul>
        <li>C-Programming Language</li>
        <li>Makefile</li>
        <li>Git | GitHub</li>
    </ul>
</div>
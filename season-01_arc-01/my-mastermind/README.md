# My_Mastermind
It is implementation of the famous Game > Mastermind

# Info about Mastermind
<pre>
1) Consist of 8 pieces of different colors<br/>
                    ==> Pieces will be :
                                        0, 1, 2, 3, 4, 5, 6, 7

2) Secret Code > Consist of 4 distinct pieces 

3) CodeBreaker has > 10 Attempts (By default)<br/>
                    ==> To FIND the Secret Code.

                    ==> After each Input
                        ==> Game indicates to the CodeBreaker
                            ==> The NUMBER of :
                                            - WELL PLACED Pieces
                                                            ==> It's mean that is > Present in the Secret Code
                                                                ==> And Pieces is > In its sequence.
                                                    
                                            - MISPLASED Pieces
                                                            ==> It's mean that is > Present in the Secret Code
                                                                ==> But Pieces is not > In its sequence.

                    ==> If CodeBreaker > Find the Secret Code
                        ==> He wins
                            ==> And Game STOPS.
</pre>
# Game Instruction
Secret Code > Can be: <br/>
            1) Only digits from 0-7;
            2) Only 4 Different digits.

Attempts > Can be from 1-99 !
(Since I think that there should be a maximum allowable attempts and this is 99).


# Instructions to Run the Program:
# 1) The first way > To run with Default parameters
    I)./my_mastermind
            Secret Code: 5432 (Generated random)
            Attempts   : 10   (By default)
    II) Game Starts
# 2) The second way > To run with User Settings > For the Secret Code
    I)./my_mastermind -c "1234"
            Secret Code: 1234
            Attempts   : 10 (By default)
    II) Game Starts

# 3) The third way > To run with User Settings > For the Attempts.
    I)./my_mastermind -t "20"
            Secret Code: 5432 (Generated Random)
            Attempts   : 20
    II) Game Starts

# NOTE: 
You can't run the game with User Settings > For the Secret Code && Attempts at the same time !
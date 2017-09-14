# Aim
## To build a efficient message passing system in ARGoS

### Steps needed to be taken

1. Ip-like manipulation.
    1. We can only manage a switch not a router

## Message

  Before we decide how to design the communication system we have to  
understand the message we need to send.  

### Message has these four parts
1. data
2. range
3. horizontal_bearing
4. vertical_bearing  

### data  

It is table of ten byte size table. To say simple c++ vocabulary. It is an
array of size ten and each of value varying from zero to two hundred and fifty  
five [0,255].

Another important thing about range_and_bearing in ARGoS is that only the  
data part a programmer need to worry other three parts are managed by ARGoS on  
its own.
### Step 1: Telling the address

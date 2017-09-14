# Aim
## To build a efficient message passing system in ARGoS

### Steps needed to be taken

1. Ip-like manipulation.
    1. We can only manage a switch not a router

## Message

 Before we decide how to design the communication system we have to understand  
 the message we need to send.  

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

### range

range in the range_and_bearing message gives information to receiver about how  
far the sender is from it.

### horizontal_bearing and vertical_bearing

These both bearing gives the orientation of the sender from the receiver in x-y  
plane and the y-z plane respectively.

## Conclusions about message:

By knowing these things about the message we can come to the following conclusions  
- A receiver knows the position from which each message has come
- A receiver has no idea who has sent the message
- Sender can't choose who he sends the message
- All persons in line of sight receive the message

### Step 1: Telling the address

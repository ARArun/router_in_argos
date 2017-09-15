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
- All robots in line of sight receive the message


## Step 1: Telling the address

### Primary Aims:

Any message sent must have two things.
- From address
- To address

In computer messages we use ip address to say from and to address and router  
sends to the correct device accordingly. But here there is no routers though  
we are trying to design one as we are not interested in changing the core of  
ARGoS. So we will settle to switches.

So how does a basic primitive switch works. Every message which has the address  
of the destination is sent to every device. A device picks a message if the  
destination address mentioned in the message matches with it's own address. If  
the message is meant to be a broadcast all devices will respond to the message.

This is what we will try to simulate in this experiment.


### Assumption

The following assumptions we will be made at least for now so that address could  
be given easily.

- Less than 255 robots are there in a simulation
- the first byte of the message specifies the sender
- the second byte specifies the receiver
- If we want send message to everybody then second byte is set as zero

### Assignment of address

We have to figure out a way to give address to all robots with out the names  
clashing with each other. An unique variable like a primary key in sql is needed  
Thankfully we have the robot.id a string unique to each and every robot in the  
experiment.

    robot.id --> [1,255]

This is our goal. How do we go about it.

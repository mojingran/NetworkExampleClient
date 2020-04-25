import processing.net.*;

Client myClient;
String incoming;
String outgoing;
String valid ="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890~!@#$%^&*()_+-={}[]";

void setup(){
 size(300,300);
 textAlign(CENTER);
 textSize(20);
 
 incoming="";
 outgoing="";
                        //sketch         //port #
  myClient = new Client(this,"127.0.0.1",1234);
                             //ip address
}

void draw(){
 background(255);
 fill(0);
 text(incoming,width/2,height/2-100);
 text(outgoing,width/2,height/2+100);
 if(myClient.available()>0){
  incoming = myClient.readString(); 
 }
  
}

void keyPressed(){
 //myClient.write("HELLO!");
 if(key==ENTER){
  myClient.write(outgoing);
  outgoing="";
  
 }else if(key==BACKSPACE&& outgoing.length()>0){
  outgoing=outgoing.substring(0,outgoing.length()-1); 
 }
 else if(valid.contains(""+key)){
  outgoing=outgoing+key; 
 }
}

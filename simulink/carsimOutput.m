function [sys,x0] = carsimOutput(t,x,u,flag)
%%
global lc;
% glb_data = 1;
global Zone Theta glo_X glo_Y ini_heading;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if flag==0
    sys=[0;0;6;6;1;1];
    x0=[];
    lc = lcm.lcm.LCM.getSingleton();
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Zone=51;
    ini_lat=31.290351854292886;		
    ini_lon=121.202328538168020;
    ini_heading=322.244090323916170;
    %Theta=(90-ini_heading)*pi/180.0;
    Theta=(ini_heading)*pi/180.0;
%     [glo_X,glo_Y]=ll2utm(ini_lat,ini_lon);
    [glo_Y,glo_X]=ll2utm(ini_lat,ini_lon);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif flag==3
    
    msgGPS=lcmtypes.PacketGPS(); 
    msgCan = lcmtypes.PacketCanMsg(); % 向Can中发送 速度、方向盘转角
    msgReckon = lcmtypes.PacketReckon();
    
    if u(6)== 1
        msgCan.speed = u(1);     
        msgCan.steer = u(2);
        msgCan.gearPos = 2;
        msgCan.reckon = msgReckon;
        lc.publish('CANMsg', msgCan);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
            %dY=u(3)*cos(Theta)-u(4)*sin(Theta);
            %dX=u(3)*sin(Theta)+u(4)*cos(Theta);
            dX=u(3)*cos(Theta)+u(4)*sin(Theta);
            dY=u(3)*sin(Theta)-u(4)*cos(Theta);
            X = dX + glo_X;
            Y = dY + glo_Y;
%             [lat,lon]=utm2ll(X,Y,Zone);
            [lat,lon]=utm2ll(Y,X,Zone);
            msgGPS.lat=lat;
            msgGPS.lon=lon;
             msgGPS.heading=-u(5)+ini_heading;
            
            msgGPS.vx=0.0;
            msgGPS.vy=u(1)/3.6;
            msgGPS.wz=0.0;
            msgGPS.speed=u(1)/3.6;
            msgGPS.referenceTime=100000;
            msgGPS.accuracy=0.1;
            lc.publish('GPS', msgGPS);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
       
    end
    sys=[msgCan.speed;msgCan.steer;msgGPS.lat;msgGPS.lon;msgGPS.heading;u(6)];
  
else sys=[];
end

          
 







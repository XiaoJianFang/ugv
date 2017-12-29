
function [sys,x0] = carsimInput(t,x,u,flag)
%%       
global aggregator Speed SteeringWheel
if flag==0
    lc = lcm.lcm.LCM.getSingleton();
    aggregator = lcm.lcm.MessageAggregator();
    lc.subscribe('Control', aggregator);
    sys=[0;0;2;0;1;1];
    x0=[];
    
elseif flag==3 
%     sys=[0];
    millis_to_wait = 5;
    msg = aggregator.getNextMessage(millis_to_wait);
    
    if ~isempty(msg)

        m = lcmtypes.PacketControl(msg.data);
        
        Speed = m.Speed;
        SteeringWheel = m.SteeringWheel;
        Estop = m.Estop;
        
        if Estop == 1   % 判断停止标志，如果为1，则速度赋值为0
            Speed = 0;
        end       
    end  
    sys=[Speed; SteeringWheel];
else sys=[];
end
%%

 







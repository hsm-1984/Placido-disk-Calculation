r=8;
xB=-60-r;yB=6;
xC=-r;yC=16.5;
SSB=(xB^2+yB^2)^0.5;
SSC=(xC^2+yC^2)^0.5;
IxB=(r-(r^2-r*SSB)/(2*SSB-r))*(xB/SSB)
IyB=(r-(r^2-r*SSB)/(2*SSB-r))*(yB/SSB)
IxC=(r-(r^2-r*SSC)/(2*SSC-r))*(xC/SSC)
IyC=(r-(r^2-r*SSC)/(2*SSC-r))*(yC/SSC)
u=50;uu=u+1;
d=(IyC-IyB)/u
IJZ=ones(uu,2);
for i=1:uu;
    IJZ(i,2)=IyB+d*(i-1);
end
aa=polyfit([IxB,IxC],[IyB,IyC],1);
for i=1:uu;
    IJZ(i,1)= (IJZ(i,2)-aa(2))/aa(1);
end
IX=IJZ(:,1);IY=IJZ(:,2);

figure(1),plot(IX,IY,'-O'),axis ([-12 -4 0 11]),xlabel('length mm'),ylabel('length mm');
text(-11.9,1,'B`');text(-4.7,9.7,'C`');text(-11.9,0.5,'(-11.706,1.033)');text(-4.9,9.2,'(-4.748,9.794)')

  legend('virtual image projection','Location','NorthWest');set(legend,'Orientation','horizon')
OJZ=ones(uu,2);
for i=1:uu;
    OJZ(i,1)= (16.5+0.175*r)/(IJZ(i,2)/IJZ(i,1)-0.175);
    OJZ(i,2)=IJZ(i,2)/IJZ(i,1)*(16.5+0.175*r)/(IJZ(i,2)/IJZ(i,1)-0.175);
end
OX=OJZ(:,1);OY=OJZ(:,2);

figure(2),plot(OX,OY,'-*'),axis ([-70 -4 5 17]);xlabel('length mm'),ylabel('length mm');
text(-69,6,'B');text(-7.7,16.5,'C');text(-69,5.5,'(-68,6)');text(-8,16,'(-8,16.5)')
 legend('rings distribution','Location','NorthWest');set(legend,'Orientation','horizon')

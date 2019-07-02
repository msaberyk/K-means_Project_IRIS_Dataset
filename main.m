clc;
clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
irisdata=load('iris.data');
irisclass=zeros(150,1);
irisdatanew=irisdata;
irisclassnew=zeros(150,1);
irisclass(1:50,1)=1;
irisclass(51:100,1)=2;
irisclass(101:150,1)=3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
centroid1=[irisdata(25,:)];
centroid2=[irisdata(75,:)];
centroid3=[irisdata(125,:)];
index=1;
in=0;
while(index==1)
    in=in+1
    dis1=sqrt(sum(((irisdatanew-centroid1).^2)'));
    dis2=sqrt(sum(((irisdatanew-centroid2).^2)'));
    dis3=sqrt(sum(((irisdatanew-centroid3).^2)'));
    dis=[dis1' dis2' dis3'];
    [minitem,itemindex]=min(dis');
    historyclass=irisclassnew;
    irisclassnew=itemindex';
    sumitem=zeros(3,4);
    sumindex=zeros(3,1);
    for i=1:150
        sumitem(irisclassnew(i,1),:)=sumitem(irisclassnew(i,1),:)+irisdatanew(i,:);
        sumindex(irisclassnew(i,1),1)=sumindex(irisclassnew(i,1),1)+1;
    end
    if (sumindex(1,1)~=0)
        centroid1=sumitem(1,:)./sumindex(1,1);
    end
    if (sumindex(2,1)~=0)
        centroid2=sumitem(2,:)./sumindex(2,1);
    end
    if (sumindex(3,1)~=0)
        centroid3=sumitem(3,:)./sumindex(3,1);
    end
    if (historyclass==irisclassnew)
        index=0;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
count=0;
for i=1:150
    if (irisclass(i,1)-irisclassnew(i,1)==0)
        count=count+1;
    end
end
        
(count/150)*100
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

